import 'package:math_game/math_game/utils/expression_generator.dart';

abstract class GameFlowEvent {
  const GameFlowEvent();
}

class GameFlowEventShowSettings extends GameFlowEvent {
  const GameFlowEventShowSettings();
}

class GameFlowEventStartGame extends GameFlowEvent {
  final ExpressionGenerator generator;
  const GameFlowEventStartGame(this.generator);
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
