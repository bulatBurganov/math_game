import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:math_game/math_game/utils/expression_generator.dart';
part 'game_flow_state.freezed.dart';

@freezed
sealed class GameFlowState with _$GameFlowState {
  const factory GameFlowState.showSettings() = GameFlowStateShowSettings;
  const factory GameFlowState.startGame(ExpressionGenerator generator) =
      GameFlowStateStartGame;
  const factory GameFlowState.finishGame() = GameFlowStateFinishGame;
  const factory GameFlowState.gameOver(int scores) = GameFlowStateGameOver;
  const factory GameFlowState.restartGame() = GameFlowStateRestartGame;
}
