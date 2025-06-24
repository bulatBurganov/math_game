import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:math_game/math_game/domain/model/game_settings_model.dart';

part 'game_settings_state.freezed.dart';

@freezed
class GameSettingsState with _$GameSettingsState {
  factory GameSettingsState({
    @Default(GameDifficulty.easy) GameDifficulty difficulty,
    @Default(GameUserSettings()) GameUserSettings userSettings,
  }) = _GameSettingsState;
}

@freezed
class GameUserSettings with _$GameUserSettings {
  const factory GameUserSettings({
    @Default(true) bool usePlus,
    @Default(true) bool useMinus,
    @Default(false) bool useMultiply,
    @Default(false) bool useDivide,
    @Default(2) int? termLength,
    @Default(1) int? min,
    @Default(10) int? max,
    ValidationErrors? validationErrors,
  }) = _GameAdditionalSettings;
}

enum ValidationErrors {
  selectAtLeastOneOperator,
  minMaxAndLengthMustBeFilled,
  maxMustBeLargerThanMin,
}
