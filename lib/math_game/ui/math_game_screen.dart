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
              print(state.timeLeft);
              if (state.levelModel.isEmpty) return const Offstage();
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _IconAndTextWidget(
                          text: 'Очки: ${state.scores}',
                          icon: const Icon(Icons.star),
                        ),
                        _IconAndTextWidget(
                          text: 'Жизни: ${state.lives}',
                          icon: const Icon(Icons.favorite, color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TweenAnimationBuilder<double>(
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear,
                      tween: Tween<double>(begin: 0, end: state.timeLeft),
                      builder: (context, value, _) {
                        return LinearProgressIndicator(
                          value: value,
                          minHeight: 24,
                          borderRadius: BorderRadius.circular(25),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
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
                                itemCount:
                                    state.levelModel.first.answers.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return BounceButton(
                                    textSize: 24,
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
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                      mainAxisExtent:
                                          MediaQuery.of(context).size.height /
                                          8,
                                    ),
                              ),
                            ],
                          ),
                        ),
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

class _IconAndTextWidget extends StatelessWidget {
  final String text;
  final Widget icon;
  const _IconAndTextWidget({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
