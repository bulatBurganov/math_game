import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:math_game/math_game/domain/model/game_settings_model.dart';

part 'game_settings_state.freezed.dart';

@freezed
class GameSettingsState with _$GameSettingsState {
  factory GameSettingsState({
    @Default(GameDifficulty.easy) GameDifficulty difficulty,
    @Default(GameAdditionalSettings())
    GameAdditionalSettings additionalSettings,
  }) = _GameSettingsState;
}

@freezed
class GameAdditionalSettings with _$GameAdditionalSettings {
  const factory GameAdditionalSettings({
    @Default(true) bool usePlus,
    @Default(true) bool useMinus,
    @Default(false) bool useMultiply,
    @Default(false) bool useDivide,
    @Default(2) int termLength,
    @Default(1) int min,
    @Default(10) int max,
  }) = _GameAdditionalSettings;
}
