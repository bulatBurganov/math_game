import 'package:flutter/material.dart';

class AnimatedGradientContainer extends StatefulWidget {
  final Size size;
  final Duration cycle;
  final List<Color> colors;
  final Widget child;

  const AnimatedGradientContainer({
    super.key,
    required this.child,
    required this.size,
    required this.cycle,
    required this.colors,
  });

  @override
  State<AnimatedGradientContainer> createState() => _FancyContainer();
}

class _FancyContainer extends State<AnimatedGradientContainer>
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
