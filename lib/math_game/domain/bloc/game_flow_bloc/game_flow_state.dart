abstract class GameFlowState {
  const GameFlowState();
}

class GameFlowStateShowSettings extends GameFlowState {
  const GameFlowStateShowSettings();
}

class GameFlowStateStartGame extends GameFlowState {
  const GameFlowStateStartGame();
}

class GameFlowStateFinishGame extends GameFlowState {
  const GameFlowStateFinishGame();
}

class GameFlowStateGameOver extends GameFlowState {
  final int scores;
  const GameFlowStateGameOver(this.scores);
}

class GameFlowStateRestartGame extends GameFlowState {
  const GameFlowStateRestartGame();
}
