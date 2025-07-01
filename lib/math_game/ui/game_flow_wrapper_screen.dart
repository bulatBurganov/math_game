import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_state.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_cubit.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_state.dart';
import 'package:math_game/router/app_router.gr.dart';

@RoutePage()
class GameFlowWrapperScreen extends StatefulWidget implements AutoRouteWrapper {
  const GameFlowWrapperScreen({super.key});

  @override
  State<GameFlowWrapperScreen> createState() => _GameFlowWrapperScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _GameFlowWrapperScreenState extends State<GameFlowWrapperScreen> {
  late GameFlowBloc _gameFlowBloc;
  late GameSettingsCubit _gameSettingsCubit;

  @override
  void initState() {
    _gameFlowBloc = GameFlowBloc();
    _gameSettingsCubit = GameSettingsCubit(
      gameFlowBloc: _gameFlowBloc,
      initialState: GameSettingsState(),
    );

    _gameFlowBloc.add(const GameFlowEventShowSettings());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _gameFlowBloc),
        BlocProvider.value(value: _gameSettingsCubit),
      ],
      child: BlocListener<GameFlowBloc, GameFlowState>(
        listener: (context, state) {
          if (state is GameFlowStateShowSettings) {
            context.router.replace(const GameSettingsRoute());
          } else if (state is GameFlowStateStartGame) {
            context.router.replace(const MathGameRoute());
          } else if (state is GameFlowStateFinishGame) {
            context.router.pop();
          } else if (state is GameFlowStateGameOver) {
            context.router.replace(GameOverRoute(scores: state.scores));
          } else if (state is GameFlowStateRestartGame) {
            context.router.replace(const GameSettingsRoute());
          }
        },
        child: const AutoRouter(),
      ),
    );
  }
}
