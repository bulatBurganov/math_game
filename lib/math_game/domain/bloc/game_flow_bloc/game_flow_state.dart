import 'package:freezed_annotation/freezed_annotation.dart';
part 'game_flow_state.freezed.dart';

@freezed
sealed class GameFlowState with _$GameFlowState {
  const factory GameFlowState.showSettings() = GameFlowStateShowSettings;
  const factory GameFlowState.startGame() = GameFlowStateStartGame;
  const factory GameFlowState.finishGame() = GameFlowStateFinishGame;
  const factory GameFlowState.gameOver(int scores) = GameFlowStateGameOver;
  const factory GameFlowState.restartGame() = GameFlowStateRestartGame;
}
