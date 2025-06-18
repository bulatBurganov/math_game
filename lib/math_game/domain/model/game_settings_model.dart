import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_settings_model.freezed.dart';

enum Difficulty {
  @JsonValue('easy')
  easy,
  @JsonValue('medium')
  medium,
  @JsonValue('hard')
  hard,
  @JsonValue('genius')
  genius,
}

@freezed
class GameSettingsModel with _$GameSettingsModel {
  factory GameSettingsModel({
    @Default(Difficulty.easy) Difficulty level,
    @Default(false) bool isMultiplicationEnabled,
    @Default(false) bool isDivisionEnabled,
  }) = _GameSettingsModel;
}
