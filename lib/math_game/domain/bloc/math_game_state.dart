import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:math_game/math_game/constants/game_constants.dart';
import 'package:math_game/math_game/domain/model/bonus_model.dart';
import 'package:math_game/math_game/domain/model/problem_model.dart';

part 'math_game_state.freezed.dart';

@freezed
class MathGameState with _$MathGameState {
  factory MathGameState({
    @Default(<ProblemModel>[]) List<ProblemModel> levelModel,
    @Default(0) int scores,
    @Default(defaultLivesCount) int lives,
    @Default(Duration(seconds: 0)) Duration timer,
    @Default(1.0) double timeLeft,
    GameBonusModel? bonus,
  }) = _MathGameState;
}
