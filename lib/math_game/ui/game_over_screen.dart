import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/common/widgets/bounce_button.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';

@RoutePage()
class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GAME OVER',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),

            SizedBox(
              height: 50,
              child: BounceButton(
                onTap: () {
                  context.read<GameFlowBloc>().add(GameFlowEventStartGame());
                },
                duration: const Duration(milliseconds: 150),
                child: Text('Restart'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: BounceButton(
                onTap: () {
                  context.read<GameFlowBloc>().add(GameFlowEventFinishGame());
                },
                duration: const Duration(milliseconds: 150),
                child: Text('Finish'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
