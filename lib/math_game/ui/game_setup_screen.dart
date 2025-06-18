import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';

@RoutePage()
class GameSetupScreen extends StatelessWidget {
  const GameSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read<GameFlowBloc>().add(GameFlowEventStartGame());
          },
          child: Text('Settings'),
        ),
      ),
    );
  }
}
