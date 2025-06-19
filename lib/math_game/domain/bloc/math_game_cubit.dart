import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/constants/game_constants.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_cubit.dart';
import 'package:math_game/math_game/domain/bloc/math_game_state.dart';
import 'package:math_game/math_game/domain/model/problem_model.dart';
import 'package:math_game/math_game/utils/math_expression_parser.dart';

class MathGameCubit extends Cubit<MathGameState> {
  MathGameCubit({required this.gameFlowBloc, required this.gameSettingsCubit})
    : super(MathGameState());
  final GameFlowBloc gameFlowBloc;
  final GameSettingsCubit gameSettingsCubit;
  final _levelDuration = Duration(seconds: 10);
  Timer? _timer;

  Future<void> startGame() async {
    print(gameSettingsCubit.state.difficulty);
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
        timer: _levelDuration,
      ),
    );

    _startTimer();
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
    gameFlowBloc.add(GameFlowEventGameOver());
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
