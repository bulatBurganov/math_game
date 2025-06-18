import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/math_game_cubit.dart';
import 'package:math_game/math_game/domain/bloc/math_game_state.dart';
import 'package:math_game/common/widgets/bounce_button.dart';
import 'package:math_game/math_game/domain/model/game_settings_model.dart';
import 'package:math_game/math_game/ui/widget/timer_widget.dart';

@RoutePage()
class MathGameScreen extends StatelessWidget {
  const MathGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return BlocProvider(
      create: (context) => MathGameCubit()..startGame(),
      child: _MathGameScreenView(),
    );
  }
}

class _MathGameScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MathGameCubit, MathGameState>(
      listener: (context, state) {
        if (state.gameSettings == null) {
          // showDialog(
          //   barrierDismissible: false,

          //   context: context,
          //   builder: (c) {
          //     var model = GameSettingsModel();
          //     return AlertDialog(
          //       title: Text('Settings'),
          //       content: Column(
          //         children: [
          //           Row(
          //             children: [
          //               Text('easy'),
          //               Text('medium'),
          //               Text('hard'),
          //               Text('gemius'),
          //             ],
          //           ),
          //         ],
          //       ),
          //       actions: [
          //         TextButton(
          //           onPressed: () {
          //             context.read<MathGameCubit>().setSettings();
          //             c.router.pop();
          //           },
          //           child: Text('Restart'),
          //         ),
          //       ],
          //     );
          //   },
          // );
        }
        if (state.isLevelFinished) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (c) {
              return AlertDialog(
                title: Text('Game over'),
                content: Text('You have ${state.scores} scores'),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<MathGameCubit>().startGame();
                      c.router.pop();
                    },
                    child: Text('Restart'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.router.pop();
                      c.router.pop();
                    },
                    child: Text('Finish'),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Builder(
            builder: (context) {
              if (state.levelModel.isEmpty) return const Offstage();
              return Padding(
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
              );
            },
          ),
        );
      },
    );
  }
}
