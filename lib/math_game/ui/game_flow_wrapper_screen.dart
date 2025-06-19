import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_state.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_cubit.dart';
import 'package:math_game/router/app_router.gr.dart';

@RoutePage()
class GameFlowWrapperScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const GameFlowWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build game wrapper');
    return BlocListener<GameFlowBloc, GameFlowState>(
      listener: (context, state) {
        if (state is GameFlowStateShowSettings) {
          context.router.replace(GameSetupRoute());
        } else if (state is GameFlowStateStartGame) {
          context.router.replace(MathGameRoute());
        } else if (state is GameFlowStateFinishGame) {
          context.router.pop();
        } else if (state is GameFlowStateGameOver) {
          context.router.replace(GameOverRoute());
        }
      },
      child: const AutoRouter(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameFlowBloc>(
          create: (_) => GameFlowBloc()..add(GameFlowEventShowSettings()),
        ),
        BlocProvider<GameSettingsCubit>(create: (_) => GameSettingsCubit()),
      ],
      child: this,
    );
    // return BlocListener<GameFlowBloc, GameFlowState>(
    //   listener: (context, state) {

    //   },
    //   child: this,
    // );
  }
}
