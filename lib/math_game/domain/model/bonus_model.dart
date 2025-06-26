abstract class GameBonusModel {
  final int count;

  GameBonusModel({required this.count});
}

class GameBonusModelExtraTime extends GameBonusModel {
  GameBonusModelExtraTime({required super.count});
}

class GameBonusModelExtraLive extends GameBonusModel {
  GameBonusModelExtraLive({required super.count});
}
