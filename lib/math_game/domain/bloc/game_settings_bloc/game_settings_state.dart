import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:math_game/math_game/domain/model/game_settings_model.dart';

part 'game_settings_state.freezed.dart';

@freezed
class GameSettingsState with _$GameSettingsState {
  factory GameSettingsState({
    @Default(GameDifficulty.easy) GameDifficulty difficulty,
    @Default(GameUserSettings()) GameUserSettings userSettings,
  }) = _GameSettingsState;

  factory GameSettingsState.multiplicationTablePreset() => GameSettingsState(
    difficulty: GameDifficulty.user,
    userSettings: GameUserSettings.multiplicationTable(),
  );
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
    @Default(false) bool onlyPositiveResults,
    GamePresets? preset,
  }) = _GameAdditionalSettings;

  factory GameUserSettings.multiplicationTable() => const GameUserSettings(
    useDivide: false,
    usePlus: false,
    useMinus: false,
    useMultiply: true,
    termLength: 2,
    min: 1,
    max: 9,
    onlyPositiveResults: true,
    preset: GamePresets.multiplicationTable,
  );
}

enum ValidationErrors {
  selectAtLeastOneOperator,
  minMaxAndLengthMustBeFilled,
  maxMustBeLargerThanMin,
}

enum GamePresets { none, multiplicationTable }
