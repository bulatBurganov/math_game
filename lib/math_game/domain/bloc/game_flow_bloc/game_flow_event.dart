abstract class GameFlowEvent {
  const GameFlowEvent();
}

class GameFlowEventShowSettings extends GameFlowEvent {
  const GameFlowEventShowSettings();
}

class GameFlowEventStartGame extends GameFlowEvent {
  const GameFlowEventStartGame();
}

class GameFlowEventFinishGame extends GameFlowEvent {
  const GameFlowEventFinishGame();
}

class GameFlowEventGameOver extends GameFlowEvent {
  final int scores;
  const GameFlowEventGameOver(this.scores);
}

class GameFlowEventRestartGame extends GameFlowEvent {
  const GameFlowEventRestartGame();
}
