import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_state.dart';
import 'package:math_game/math_game/domain/model/game_settings_model.dart';

class GameSettingsCubit extends Cubit<GameSettingsState> {
  GameSettingsCubit() : super(GameSettingsState());

  Future<void> updateDifficulty(GameDifficulty difficulty) async {
    emit(state.copyWith(difficulty: difficulty));
  }

  Future<void> checkSettings(GameAdditionalSettings settings) async {
    emit(state.copyWith(additionalSettings: settings));
  }
}
