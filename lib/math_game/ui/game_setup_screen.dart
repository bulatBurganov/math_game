import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/common/widgets/bounce_button.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_cubit.dart';
import 'package:math_game/math_game/ui/widget/difficulty_selector.dart';

@RoutePage()
class GameSetupScreen extends StatelessWidget {
  const GameSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Difficulty',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            DifficultySelector(
              onCahnged: (difficulty) {
                context.read<GameSettingsCubit>().updateSettings(difficulty);
              },
            ),
            // const SizedBox(height: 16),
            // Container(
            //   clipBehavior: Clip.antiAlias,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(25),
            //   ),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.symmetric(horizontal: 24),
            //       filled: true,
            //       fillColor: Colors.grey[300],
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 32),
            SizedBox(
              height: 50,
              child: BounceButton(
                onTap: () {
                  context.read<GameFlowBloc>().add(GameFlowEventStartGame());
                },
                duration: const Duration(milliseconds: 150),
                child: Text('Start'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
