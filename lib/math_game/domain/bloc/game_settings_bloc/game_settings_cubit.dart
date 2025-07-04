import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_state.dart';
import 'package:math_game/math_game/domain/model/game_settings_model.dart';
import 'package:math_game/math_game/utils/expression_generator.dart';

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

  Future<void> updateUserSettings(GameUserSettings settings) async {
    if (state.userSettings.preset != null) {}
    emit(
      state.copyWith(
        userSettings: settings.copyWith(validationErrors: null, preset: null),
      ),
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

    gameFlowBloc.add(
      GameFlowEventStartGame(_getGeneratorBySettings(userSettings)),
    );
  }

  ExpressionGenerator _getGeneratorBySettings(GameUserSettings userSettings) {
    int minValue = 1;
    int maxValue = 10;
    var operators = <String>[];
    int expressionLength = 0;
    switch (state.difficulty) {
      case GameDifficulty.easy:
        operators = ['+', '-'];
        expressionLength = 2;
        break;

      case GameDifficulty.medium:
        operators = ['+', '-', '*'];
        expressionLength = 2;
        break;

      case GameDifficulty.hard:
        operators = ['+', '-', '*', '/'];
        expressionLength = 3;
        break;

      case GameDifficulty.user:
        operators = [
          if (userSettings.usePlus) '+',
          if (userSettings.useMinus) '-',
          if (userSettings.useMultiply) '*',
          if (userSettings.useDivide) '/',
        ];
        minValue = userSettings.min ?? 0;
        maxValue = userSettings.max ?? 10;
        expressionLength = userSettings.termLength ?? 2;
        break;
    }

    return ArithmeticExpressionGenerator(
      minValue: minValue,
      maxValue: maxValue,
      expressionLength: expressionLength,
      operations: operators,
    );
  }

  Future<void> setPreset(GamePresets? preset) async {
    switch (preset) {
      case GamePresets.multiplicationTable:
        emit(
          state.copyWith(userSettings: GameUserSettings.multiplicationTable()),
        );
        break;
      default:
        emit(
          state.copyWith(
            userSettings: state.userSettings.copyWith(preset: null),
          ),
        );
        log('preset droppped');
        break;
    }
  }
}
