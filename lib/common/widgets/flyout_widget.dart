import 'package:flutter/material.dart';

class _AnimationContext {
  final Object id;
  final String? text;

  _AnimationContext(this.id, this.text);
}

class FlyoutWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final String? flyout;

  const FlyoutWidget({super.key, required this.child, this.onTap, this.flyout});

  @override
  State<FlyoutWidget> createState() => _FlyoutWidgetState();
}

class _FlyoutWidgetState extends State<FlyoutWidget> {
  final List<_AnimationContext> _animations = []; // Вместо List<Object>
  static const int _maxSimultaneousAnimations = 5;

  @override
  void didUpdateWidget(covariant FlyoutWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _addBubbleAnimation();
  }

  void _addBubbleAnimation() {
    if (_animations.length >= _maxSimultaneousAnimations) return;

    setState(
      () => _animations.add(
        _AnimationContext(DateTime.now().microsecondsSinceEpoch, widget.flyout),
      ),
    );
  }

  void _removeAnimation(Object id) {
    setState(() {
      _animations.removeWhere((e) => e.id == id);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _animations.clear());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        widget.child,
        for (final ctx in _animations)
          BubbleAnimation(
            flyout: ctx.text,
            key: ObjectKey(ctx.id),
            onComplete: () => _removeAnimation(ctx.id),
          ),
      ],
    );
  }
}

class BubbleAnimation extends StatefulWidget {
  final VoidCallback onComplete;
  final String? flyout;

  const BubbleAnimation({
    super.key,
    required this.onComplete,
    required this.flyout,
  });

  @override
  State<BubbleAnimation> createState() => _BubbleAnimationState();
}

class _BubbleAnimationState extends State<BubbleAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<double> _scale;
  late final Animation<double> _offset;
  late final Animation<Color?> _color;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 1500),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            widget.onComplete();
          }
        });

    // Каскадные анимации с разными интервалами
    _opacity =
        TweenSequence<double>([
          TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 40),
          TweenSequenceItem(
            tween: Tween<double>(begin: 1.0, end: 0.0),
            weight: 60,
          ),
        ]).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
          ),
        );

    // Анимация масштаба с упругим эффектом
    _scale =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(begin: 0.0, end: 1.2),
            weight: 40,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.2,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.elasticOut)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(begin: 1.0, end: 0.8),
            weight: 40,
          ),
        ]).animate(
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
        );

    // Многофазное перемещение
    _offset = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: -20.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -20.0,
          end: -60.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -60.0,
          end: -100.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 40,
      ),
    ]).animate(_controller);

    // Анимация изменения цвета
    _color = TweenSequence<Color?>([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.green, end: Colors.lightGreen),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.lightGreen, end: Colors.orange),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.orange, end: Colors.red),
        weight: 30,
      ),
    ]).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Text(
        widget.flyout ?? '',
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(color: Colors.black26, blurRadius: 3, offset: Offset(1, 1)),
          ],
        ),
      ),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _offset.value),
          child: Opacity(
            opacity: _opacity.value,
            child: Transform.scale(
              scale: _scale.value,
              child: DefaultTextStyle.merge(
                style: TextStyle(color: _color.value),
                child: child!,
              ),
            ),
          ),
        );
      },
    );
  }
}
