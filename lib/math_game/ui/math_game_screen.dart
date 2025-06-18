import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/math_game_cubit.dart';
import 'package:math_game/math_game/domain/bloc/math_game_state.dart';
import 'package:math_game/math_game/ui/widget/bounce_button.dart';
import 'package:math_game/math_game/ui/widget/timer_widget.dart';

class MathGameScreen extends StatefulWidget {
  const MathGameScreen({super.key});

  @override
  State<MathGameScreen> createState() => _MathGameScreenState();
}

class _MathGameScreenState extends State<MathGameScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MathGameCubit, MathGameState>(
      listener: (context, state) {
        if (state.isLevelFinished) {
          showDialog(
            barrierDismissible: false,
            context: context,
            animationStyle: AnimationStyle(curve: Curves.easeIn),
            builder: (context) {
              return AlertDialog(
                title: Text('Game over'),
                content: Text('You have ${state.scores} scores'),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<MathGameCubit>().init();
                      Navigator.of(context).pop();
                    },
                    child: Text('Restart'),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Scores: ${state.scores}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Lives: ${state.lives}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TimerWidget(duration: state.timer),

                Expanded(
                  child: Center(
                    child: Text(
                      state.levelModel.first.expression,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                GridView.builder(
                  itemCount: state.levelModel.first.answers.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BounceButton(
                      onTap: () {
                        context.read<MathGameCubit>().checkAnswer(
                          state.levelModel.first.answers[index],
                        );
                      },
                      duration: Duration(milliseconds: 150),
                      child: Text(
                        state.levelModel.first.answers[index]
                            .toInt()
                            .toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: MediaQuery.of(context).size.height / 8,
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
