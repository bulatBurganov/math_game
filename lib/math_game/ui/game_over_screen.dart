import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:math_game/common/widgets/bounce_button.dart';
import 'package:math_game/generated/l10n.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';

@RoutePage()
class GameOverScreen extends StatelessWidget {
  final int scores;
  const GameOverScreen({super.key, required this.scores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () =>
              context.read<GameFlowBloc>().add(const GameFlowEventFinishGame()),
        ),
      ),
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
              S.of(context).game_over,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              S
                  .of(context)
                  .youEarnedNScores(
                    scores,
                    Intl.plural(
                      scores,
                      one: S.of(context).scoresOne,
                      few: S.of(context).scoresFew,
                      many: S.of(context).scoresMany,
                      other: S.of(context).scoresMany,
                    ),
                  ),
              style: const TextStyle(),
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 50,
              child: BounceButton(
                onTap: () {
                  context.read<GameFlowBloc>().add(
                    const GameFlowEventRestartGame(),
                  );
                },
                text: S.of(context).restart,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: BounceButton(
                onTap: () {
                  context.read<GameFlowBloc>().add(
                    const GameFlowEventFinishGame(),
                  );
                },
                text: S.of(context).finish_game,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
