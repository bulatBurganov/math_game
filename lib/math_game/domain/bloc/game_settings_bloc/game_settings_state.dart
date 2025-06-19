import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:math_game/math_game/domain/model/game_settings_model.dart';

part 'game_settings_state.freezed.dart';

@freezed
class GameSettingsState with _$GameSettingsState {
  factory GameSettingsState({
    @Default(GameDifficulty.easy) GameDifficulty difficulty,
  }) = _GameSettingsState;
}
