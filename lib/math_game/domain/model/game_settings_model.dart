import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_settings_model.freezed.dart';

enum GameDifficulty {
  @JsonValue('easy')
  easy,
  @JsonValue('medium')
  medium,
  @JsonValue('hard')
  hard,
  @JsonValue('user')
  user,
}

@freezed
class GameSettingsModel with _$GameSettingsModel {
  factory GameSettingsModel({
    @Default(GameDifficulty.easy) GameDifficulty level,
    @Default(false) bool isMultiplicationEnabled,
    @Default(false) bool isDivisionEnabled,
  }) = _GameSettingsModel;
}
