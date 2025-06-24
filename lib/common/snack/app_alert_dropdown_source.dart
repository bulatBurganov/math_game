import 'package:flutter/material.dart';

import 'tap_bounce_container.dart';

OverlayEntry? _previousEntry;

void showTopSnackBar(
  BuildContext context,
  Widget child, {
  Duration showOutAnimationDuration = const Duration(milliseconds: 1200),
  Duration hideOutAnimationDuration = const Duration(milliseconds: 550),
  Duration displayDuration = const Duration(milliseconds: 3000),
  double additionalTopPadding = 0.0,
  VoidCallback? onTap,
  OverlayState? overlayState,
  double leftPadding = 0,
  double rightPadding = 0,
}) async {
  overlayState ??= Overlay.of(context);
  late OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) {
      return TopSnackBar(
        onDismissed: () {
          overlayEntry.remove();
          _previousEntry = null;
        },
        showOutAnimationDuration: showOutAnimationDuration,
        hideOutAnimationDuration: hideOutAnimationDuration,
        displayDuration: displayDuration,
        additionalTopPadding: additionalTopPadding,
        onTap: onTap,
        leftPadding: leftPadding,
        rightPadding: rightPadding,
        child: child,
      );
    },
  );

  _previousEntry?.remove();
  overlayState.insert(overlayEntry);
  _previousEntry = overlayEntry;
}

/// Widget that controls all animations
class TopSnackBar extends StatefulWidget {
  final Widget child;
  final VoidCallback onDismissed;
  final Duration showOutAnimationDuration;
  final Duration hideOutAnimationDuration;
  final Duration displayDuration;
  final double additionalTopPadding;
  final VoidCallback? onTap;
  final double leftPadding;
  final double rightPadding;

  const TopSnackBar({
    super.key,
    required this.child,
    required this.onDismissed,
    required this.showOutAnimationDuration,
    required this.hideOutAnimationDuration,
    required this.displayDuration,
    required this.additionalTopPadding,
    this.onTap,
    this.leftPadding = 0,
    this.rightPadding = 0,
  });

  @override
  State<TopSnackBar> createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<TopSnackBar>
    with SingleTickerProviderStateMixin {
  late Animation offsetAnimation;
  late AnimationController animationController;
  double? topPosition;

  @override
  void initState() {
    topPosition = widget.additionalTopPadding;
    _setupAndStartAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _setupAndStartAnimation() async {
    animationController = AnimationController(
      vsync: this,
      duration: widget.showOutAnimationDuration,
      reverseDuration: widget.hideOutAnimationDuration,
    );

    Tween<Offset> offsetTween = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    );

    offsetAnimation =
        offsetTween.animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.elasticOut,
            reverseCurve: Curves.linearToEaseOut,
          ),
        )..addStatusListener((status) async {
          if (status == AnimationStatus.completed) {
            await Future.delayed(widget.displayDuration);
            if (mounted) {
              animationController.reverse();
              setState(() {
                topPosition = 0;
              });
            }
          }

          if (status == AnimationStatus.dismissed) {
            widget.onDismissed.call();
          }
        });

    if (mounted) {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.hideOutAnimationDuration * 1.5,
      curve: Curves.linearToEaseOut,
      top: topPosition,
      left: widget.leftPadding,
      right: widget.rightPadding,
      child: SlideTransition(
        position: offsetAnimation as Animation<Offset>,
        child: SafeArea(
          child: TapBounceContainer(
            onTap: () {
              if (mounted) {
                widget.onTap?.call();
                animationController.reverse();
              }
            },
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
