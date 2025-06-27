import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_state.dart';
import 'package:math_game/math_game/domain/model/game_settings_model.dart';

class GameSettingsCubit extends Cubit<GameSettingsState> {
  final GameFlowBloc gameFlowBloc;
  GameSettingsCubit({
    required this.gameFlowBloc,
    required GameSettingsState initialState,
  }) : super(initialState);

  Future<void> updateDifficulty(GameDifficulty difficulty) async {
    emit(
      state.copyWith(
        difficulty: difficulty,
        userSettings: state.userSettings.copyWith(validationErrors: null),
      ),
    );
  }

  Future<void> updateUSerSettings(GameUserSettings settings) async {
    emit(
      state.copyWith(userSettings: settings.copyWith(validationErrors: null)),
    );
  }

  Future<void> submit() async {
    final userSettings = state.userSettings;
    if (!userSettings.usePlus &&
        !userSettings.useMinus &&
        !userSettings.useDivide &&
        !userSettings.useMultiply) {
      log('use at least one operator');
      emit(
        state.copyWith(
          userSettings: userSettings.copyWith(
            validationErrors: ValidationErrors.selectAtLeastOneOperator,
          ),
        ),
      );
      return;
    }

    if (userSettings.max == null ||
        userSettings.min == null ||
        userSettings.termLength == null) {
      log('max min and length must be filled');
      emit(
        state.copyWith(
          userSettings: userSettings.copyWith(
            validationErrors: ValidationErrors.minMaxAndLengthMustBeFilled,
          ),
        ),
      );
      return;
    }

    if (userSettings.max != null && userSettings.min != null) {
      if (userSettings.min! > userSettings.max!) {
        log('min length must be larger than max');
        emit(
          state.copyWith(
            userSettings: userSettings.copyWith(
              validationErrors: ValidationErrors.maxMustBeLargerThanMin,
            ),
          ),
        );
        return;
      }
    }

    gameFlowBloc.add(const GameFlowEventStartGame());
  }
}
