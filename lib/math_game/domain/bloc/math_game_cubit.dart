import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/constants/game_constants.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_cubit.dart';
import 'package:math_game/math_game/domain/bloc/math_game_state.dart';
import 'package:math_game/math_game/domain/model/game_settings_model.dart';
import 'package:math_game/math_game/domain/model/problem_model.dart';
import 'package:math_game/math_game/utils/expression_generator.dart';

class MathGameCubit extends Cubit<MathGameState> {
  MathGameCubit({required this.gameFlowBloc, required this.gameSettingsCubit})
    : super(MathGameState());
  final GameFlowBloc gameFlowBloc;
  final GameSettingsCubit gameSettingsCubit;
  final _levelDuration = const Duration(seconds: 10);
  Timer? _timer;
  ExpressionGenerator? _generator;
  List<String> _operators = [];
  final _random = Random();
  int _next(int min, int max) => min + _random.nextInt(max - min);

  Future<void> startGame() async {
    final difficulty = gameSettingsCubit.state.difficulty;
    final userSettings = gameSettingsCubit.state.userSettings;
    int minValue = 1;
    int maxValue = 10;
    int numTerms = 2;
    switch (difficulty) {
      case GameDifficulty.easy:
        _operators = ['+', '-'];
        break;

      case GameDifficulty.medium:
        _operators = ['+', '-', '*'];

        break;

      case GameDifficulty.hard:
        _operators = ['+', '-', '*', '/'];
        numTerms = 3;
        break;

      case GameDifficulty.genius:
        _operators = [
          if (userSettings.usePlus) '+',
          if (userSettings.useMinus) '-',
          if (userSettings.useMultiply) '*',
          if (userSettings.useDivide) '/',
        ];
        minValue = userSettings.min ?? 0;
        maxValue = userSettings.max ?? 10;
        numTerms = userSettings.termLength ?? 2;

        break;
    }

    _generator = ExpressionGenerator(minValue: minValue, maxValue: maxValue);

    final problems = await _addProblenms(numTerms);

    emit(
      state.copyWith(
        levelModel: problems,
        scores: 0,
        lives: defaultLivesCount,
        timer: _levelDuration,
      ),
    );

    _startTimer();
  }

  Future<List<ProblemModel>> _addProblenms(int numTerms) async {
    if (_generator == null) throw 'Generator is null';

    var problems = [...state.levelModel];
    int problemsToGenerate = problems.isEmpty ? 10 : 5;

    for (int i = 0; i < problemsToGenerate; i++) {
      final (expr, res) = _generator!.generate(
        numTerms: numTerms,
        operations: _operators,
      );

      problems.add(
        ProblemModel(
          expr,
          res.toDouble(),
          _generateAnswerVariants(res.toDouble()),
        ),
      );
    }

    return problems;
  }

  List<double> _generateAnswerVariants(double res) {
    final answers = <double>[];
    for (int i = 0; i < 3; i++) {
      if (_random.nextBool()) {
        answers.add(res + _next(1, 4).toDouble());
      } else {
        answers.add((res - _next(1, 4).toDouble()));
      }
    }

    answers.add(res);
    answers.shuffle();
    return answers;
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
        _finishGame(null);
      }
    } else {
      int lives = state.lives;
      lives--;
      if (lives == 0) {
        _finishGame(0);
      } else {
        emit(state.copyWith(lives: lives));
      }
    }
  }

  _finishGame(int? livesCount) {
    _timer?.cancel();
    emit(state.copyWith(lives: livesCount ?? state.lives));
    gameFlowBloc.add(GameFlowEventGameOver(state.scores));
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), _timerCallback);
  }

  void _timerCallback(Timer? timer) {
    print('timer callback');
    final seconds = state.timer.inSeconds - 1;
    if (seconds < 0) {
      _finishGame(null);
    } else {
      emit(state.copyWith(timer: Duration(seconds: seconds)));
    }
  }
}
