import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/constants/game_constants.dart';
import 'package:math_game/math_game/domain/bloc/math_game_state.dart';
import 'package:math_game/math_game/domain/model/problem_model.dart';

class MathGameCubit extends Cubit<MathGameState> {
  MathGameCubit(super.initialState);

  Future<void> init() async {
    final operators = ['+', '-'];
    final random = Random();
    int next(int min, int max) => min + random.nextInt(max - min);
    final problems = <ProblemModel>[];
    for (int i = 0; i < 2; i++) {
      final operator = operators[next(0, 2)];

      final expr = '${next(0, 10)}$operator${next(0, 10)}';
      final correctAnswer = MathExpressionParser.evaluate(expr);

      final answers = [
        correctAnswer,
        correctAnswer + 1,
        correctAnswer - 1,
        correctAnswer + 2,
      ];
      answers.shuffle();
      final problem = ProblemModel(expr, correctAnswer, answers);

      problems.add(problem);
    }
    emit(
      state.copyWith(
        levelModel: problems,
        scores: 0,
        lives: defaultLivesCount,
        isLevelFinished: false,
      ),
    );
  }

  Future<void> checkAnswer(double answer) async {
    if (state.levelModel.first.result == answer) {
      if (state.levelModel.length > 1) {
        final list = [...state.levelModel];
        list.removeAt(0);
        emit(
          state.copyWith(
            levelModel: list,
            scores: state.scores + defaultScoreIncrement,
          ),
        );
      } else {
        emit(state.copyWith(isLevelFinished: true));
      }
    } else {
      int lives = state.lives;
      lives--;
      if (lives == 0) {
        emit(state.copyWith(lives: 0, isLevelFinished: true));
      } else {
        emit(state.copyWith(lives: lives));
      }
    }
  }
}

class MathExpressionParser {
  static double evaluate(String expression) {
    // Удаляем пробелы и конвертируем в нижний регистр
    expression = expression.replaceAll(' ', '').toLowerCase();

    // Токенизация выражения
    final tokens = _tokenize(expression);

    // Конвертация в обратную польскую нотацию (RPN)
    final rpn = _convertToRPN(tokens);

    // Вычисление результата
    return _evaluateRPN(rpn);
  }

  static List<String> _tokenize(String expression) {
    final tokens = <String>[];
    final buffer = StringBuffer();
    bool lastWasDigit = false;

    for (int i = 0; i < expression.length; i++) {
      final char = expression[i];

      if (_isDigit(char) || char == '.') {
        buffer.write(char);
        lastWasDigit = true;
      } else if (_isOperator(char)) {
        if (buffer.isNotEmpty) {
          tokens.add(buffer.toString());
          buffer.clear();
        }

        // Обработка унарного минуса
        if (char == '-' &&
            (i == 0 ||
                _isOperator(expression[i - 1]) ||
                expression[i - 1] == '(')) {
          tokens.add('0'); // Добавляем ноль перед унарным минусом
        }

        tokens.add(char);
        lastWasDigit = false;
      } else if (char == '(' || char == ')') {
        if (buffer.isNotEmpty) {
          tokens.add(buffer.toString());
          buffer.clear();
        }
        tokens.add(char);
        lastWasDigit = false;
      } else {
        throw FormatException('Недопустимый символ: $char');
      }
    }

    if (buffer.isNotEmpty) {
      tokens.add(buffer.toString());
    }

    return tokens;
  }

  static List<String> _convertToRPN(List<String> tokens) {
    final output = <String>[];
    final operators = <String>[];
    final precedence = {'+': 1, '-': 1, '*': 2, '/': 2};

    for (final token in tokens) {
      if (double.tryParse(token) != null) {
        output.add(token);
      } else if (token == '(') {
        operators.add(token);
      } else if (token == ')') {
        while (operators.isNotEmpty && operators.last != '(') {
          output.add(operators.removeLast());
        }
        operators.removeLast(); // Удаляем '('
      } else if (_isOperator(token)) {
        while (operators.isNotEmpty &&
            operators.last != '(' &&
            precedence[token]! <= precedence[operators.last]!) {
          output.add(operators.removeLast());
        }
        operators.add(token);
      }
    }

    while (operators.isNotEmpty) {
      output.add(operators.removeLast());
    }

    return output;
  }

  static double _evaluateRPN(List<String> rpn) {
    final stack = <double>[];

    for (final token in rpn) {
      if (double.tryParse(token) != null) {
        stack.add(double.parse(token));
      } else {
        final b = stack.removeLast();
        final a = stack.isNotEmpty ? stack.removeLast() : 0;

        switch (token) {
          case '+':
            stack.add(a + b);
            break;
          case '-':
            stack.add(a - b);
            break;
          case '*':
            stack.add(a * b);
            break;
          case '/':
            if (b == 0) throw Exception('Деление на ноль');
            stack.add(a / b);
            break;
          default:
            throw Exception('Неизвестный оператор: $token');
        }
      }
    }

    return stack.last;
  }

  static bool _isDigit(String s) =>
      s.codeUnitAt(0) >= 48 && s.codeUnitAt(0) <= 57;
  static bool _isOperator(String s) => ['+', '-', '*', '/'].contains(s);
}
