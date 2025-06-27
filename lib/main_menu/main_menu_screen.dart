import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:math_game/common/widgets/bounce_button.dart';
import 'package:math_game/generated/l10n.dart';
import 'package:math_game/math_game/ui/game_flow_wrapper_screen.dart';
import 'package:math_game/router/app_router.gr.dart';

@RoutePage()
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyContainer(
        colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.primaryContainer,
          Theme.of(context).colorScheme.primary,
        ],
        size: MediaQuery.of(context).size,
        cycle: const Duration(seconds: 150),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    top: MediaQuery.of(context).padding.top + 50,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      S.of(context).app_name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                child: BounceButton(
                  onTap: () {
                    context.router.push(GameFlowWrapperRoute());
                  },
                  child: Text(S.of(context).start_game),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                child: BounceButton(
                  onTap: () {
                    context.router.push(
                      GameFlowWrapperRoute(
                        presets: GamePresets.multiplicationTable,
                      ),
                    );
                  },
                  child: Text(S.of(context).multiplicationTablePreset),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class FancyContainer extends StatefulWidget {
  final Size size;
  final Duration cycle;
  final List<Color> colors;
  final Widget child;

  const FancyContainer({
    super.key,
    required this.child,
    required this.size,
    required this.cycle,
    required this.colors,
  });

  @override
  State<FancyContainer> createState() => _FancyContainer();
}

class _FancyContainer extends State<FancyContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.cycle, vsync: this)
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.reverse();
        }
        if (controller.isDismissed) {
          controller.forward();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final aspectRatio = widget.size.height / widget.size.width;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Container(
          width: widget.size.width,
          height: widget.size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // startAngle: controller.value + 1,
              tileMode: TileMode.repeated,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: SlideGradient(
                controller.value,
                widget.size.height * aspectRatio,
              ),
              colors: widget.colors,
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}

class SlideGradient implements GradientTransform {
  final double value;
  final double offset;
  const SlideGradient(this.value, this.offset);

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    final dist = value * (bounds.width + offset) * -1;
    return Matrix4.identity()..translate(-dist);
  }
}
