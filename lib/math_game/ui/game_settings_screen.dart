import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/common/snack/snack_bloc.dart';
import 'package:math_game/common/widgets/bounce_button.dart';
import 'package:math_game/generated/l10n.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_cubit.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_state.dart';
import 'package:math_game/math_game/ui/widget/difficulty_selector.dart';

@RoutePage()
class GameSettingsScreen extends StatelessWidget {
  const GameSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameSettingsCubit, GameSettingsState>(
      listener: (context, state) {
        final errors = state.userSettings.validationErrors;
        if (state.userSettings.validationErrors != null) {
          final message = switch (errors!) {
            ValidationErrors.selectAtLeastOneOperator =>
              'Доложен быть выбран как минимум 1 оператор из числа +, -, *, /',
            ValidationErrors.maxMustBeLargerThanMin =>
              'Максимальное значение должно превышать минимальное',
            ValidationErrors.minMaxAndLengthMustBeFilled =>
              'Поля длины выражения, минимального и максимального значения должны быть заполнены',
          };
          context.read<SnackBloc>().showStringError(message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => context.read<GameFlowBloc>().add(
                const GameFlowEventFinishGame(),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              children: [
                Text(
                  S.of(context).difficulty,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                DifficultySelector(
                  initialValue: state.difficulty,
                  initialUserSettings: state.userSettings,
                  onUserSettingsChanged: (settings) {
                    context.read<GameSettingsCubit>().updateUSerSettings(
                      settings,
                    );
                  },
                  onCahnged: (difficulty) {
                    context.read<GameSettingsCubit>().updateDifficulty(
                      difficulty,
                    );
                  },
                ),

                const Spacer(),
                SizedBox(
                  height: 50,
                  child: BounceButton(
                    onTap: () {
                      context.read<GameSettingsCubit>().submit();
                      // context.read<GameFlowBloc>().add(
                      //   const GameFlowEventStartGame(),
                      // );
                    },
                    duration: const Duration(milliseconds: 150),
                    child: Text(S.of(context).start_game),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
