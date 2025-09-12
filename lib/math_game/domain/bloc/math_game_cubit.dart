import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/constants/game_constants.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/math_game_state.dart';
import 'package:math_game/math_game/domain/model/bonus_model.dart';
import 'package:math_game/math_game/domain/model/problem_model.dart';
import 'package:math_game/math_game/utils/expression_generator.dart';

class MathGameCubit extends Cubit<MathGameState> {
  MathGameCubit({required this.gameFlowBloc, required this.generator})
    : super(MathGameState());
  final GameFlowBloc gameFlowBloc;
  final ExpressionGenerator generator;
  final _levelDuration = const Duration(seconds: 20);
  Timer? _timer;
  final _random = Random();

  int _next(int min, int max) => min + _random.nextInt(max - min);

  Future<void> startGame() async {
    final problems = await _addProblems();

    emit(
      state.copyWith(
        levelModel: problems,
        scores: 0,
        lives: defaultLivesCount,
        timer: _levelDuration,
        bonus: null,
      ),
    );

    _startTimer();
  }

  Future<List<ProblemModel>> _addProblems() async {
    var problems = [...state.levelModel];
    int problemsToGenerate = problems.isEmpty ? 10 : 5;

    for (int i = 0; i < problemsToGenerate; i++) {
      var (expr, res) = generator.generate();

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
    final set = <double>{res};
    while (set.length != 4) {
      if (_random.nextBool()) {
        set.add(res + _next(1, 4).toDouble());
      } else {
        set.add((res - _next(1, 4).toDouble()));
      }
    }
    final answers = set.toList();
    answers.shuffle();
    return answers;
  }

  Future<void> checkAnswer(double answer) async {
    if (state.levelModel.first.result == answer) {
      if (state.levelModel.length > 1) {
        var list = [...state.levelModel];
        list.removeAt(0);
        if (list.length < 5) {
          list = await _addProblems();
        }
        emit(
          state.copyWith(
            levelModel: list,
            scores: state.scores + defaultScoreIncrement,
            bonus: GameBonusModelExtraTime(count: 2),
            timer: state.timer + const Duration(seconds: 2),
            timeLeft: ((state.timer.inSeconds + 2) / _levelDuration.inSeconds),
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
        emit(state.copyWith(lives: lives, bonus: null));
      }
    }
  }

  _finishGame(int? livesCount) {
    _timer?.cancel();
    emit(state.copyWith(lives: livesCount ?? state.lives, bonus: null));
    gameFlowBloc.add(GameFlowEventGameOver(state.scores));
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), _timerCallback);
  }

  void _timerCallback(Timer? timer) {
    final seconds = state.timer.inSeconds - 1;
    if (seconds < 0) {
      _finishGame(null);
    } else {
      final left = (seconds / _levelDuration.inSeconds);
      emit(
        state.copyWith(
          timer: Duration(seconds: seconds),
          bonus: null,
          timeLeft: left,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _timer = null;
    return super.close();
  }
}
