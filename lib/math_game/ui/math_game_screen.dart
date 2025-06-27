import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/common/widgets/bounce_button.dart';
import 'package:math_game/common/widgets/flyout_widget.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_cubit.dart';
import 'package:math_game/math_game/domain/bloc/math_game_cubit.dart';
import 'package:math_game/math_game/domain/bloc/math_game_state.dart';
import 'package:math_game/math_game/domain/model/bonus_model.dart';
import 'package:math_game/math_game/ui/widget/timer_widget.dart';

@RoutePage()
class MathGameScreen extends StatelessWidget {
  const MathGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MathGameCubit(
        gameFlowBloc: context.read<GameFlowBloc>(),
        gameSettingsCubit: context.read<GameSettingsCubit>(),
      )..startGame(),
      child: _MathGameScreenView(),
    );
  }
}

class _MathGameScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MathGameCubit, MathGameState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => context.read<GameFlowBloc>().add(
                const GameFlowEventFinishGame(),
              ),
            ),
          ),
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
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Lives: ${state.lives}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TimerWidget(duration: state.timer),
                    Expanded(
                      child: Center(
                        child: FlyoutWidget(
                          flyout: _getBonusText(state.bonus),
                          child: Text(
                            state.levelModel.first.expression,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.levelModel.first.answers.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BounceButton(
                          tapAfterAnimation: false,
                          text: state.levelModel.first.answers[index]
                              .toInt()
                              .toString(),
                          onTap: () {
                            context.read<MathGameCubit>().checkAnswer(
                              state.levelModel.first.answers[index],
                            );
                          },
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

  String? _getBonusText(GameBonusModel? bonus) {
    switch (bonus) {
      case GameBonusModelExtraTime():
        return '+ ${bonus.count} сек.';
      case GameBonusModelExtraLive():
        return '+ ${bonus.count} ❤';
      default:
        return null;
    }
  }
}
