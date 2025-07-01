import 'package:flutter/material.dart';

class BounceButton extends StatefulWidget {
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final double textSize;
  final Function onTap;
  final Duration duration;
  final Curve curve;
  final bool tapAfterAnimation;
  final FontWeight? fontWeight;

  const BounceButton({
    super.key,
    required this.text,
    required this.onTap,
    this.duration = const Duration(milliseconds: 150),
    this.curve = Curves.bounceIn,
    this.tapAfterAnimation = true,
    this.buttonColor,
    this.textColor,
    this.textSize = 16,
    this.fontWeight,
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
      onTap: () async {
        if (!widget.tapAfterAnimation) {
          widget.onTap();
        }
        _controller.forward().then((_) {
          _controller.reverse().then((_) {
            if (widget.tapAfterAnimation) {
              widget.onTap();
            }
          });
        });
      },

      onTapDown: (details) {
        _controller.forward();
      },
      onTapUp: (details) {
        _controller.reverse();
      },

      onTapCancel: () {
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: Material(
              borderRadius: BorderRadius.circular(20),

              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: AnimatedContainer(
                alignment: Alignment.center,
                duration: widget.duration,

                decoration: BoxDecoration(
                  color:
                      widget.buttonColor ??
                      Theme.of(context).colorScheme.primary,
                ),
                child: child,
              ),
            ),
          );
        },
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.textSize,
            color: widget.textColor ?? Theme.of(context).colorScheme.onPrimary,
            fontWeight: widget.fontWeight ?? FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
