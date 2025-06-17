import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/math_game_cubit.dart';
import 'package:math_game/math_game/domain/bloc/math_game_state.dart';

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

class BounceButton extends StatefulWidget {
  final Widget child;
  final Function onTap;
  final Duration duration;

  const BounceButton({
    super.key,
    required this.child,
    required this.onTap,
    required this.duration,
  });

  @override
  State<BounceButton> createState() => _BounceButtonState();
}

class _BounceButtonState extends State<BounceButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        _controller.forward().then((_) {
          _controller.reverse();
        });
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: widget.duration,
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: child,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}
