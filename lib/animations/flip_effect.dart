import 'dart:math' as math;
import 'package:flutter/widgets.dart';

class CardFlipEffect extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final AnimationController controller; // Ajoutez un AnimationController

  const CardFlipEffect({
    super.key,
    required this.child,
    required this.duration,
    required this.controller, // Requiert un AnimationController
  });

  @override
  State<CardFlipEffect> createState() => _CardFlipEffectState();
}

class _CardFlipEffectState extends State<CardFlipEffect> {
  Widget? _previousChild;

  @override
  void didUpdateWidget(covariant CardFlipEffect oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.child.key != oldWidget.child.key) {
      _handleChildChanged(widget.child, oldWidget.child);
    }
  }

  void _handleChildChanged(Widget newChild, Widget previousChild) {
    _previousChild = previousChild;
    widget.controller.forward(); // Utilisez le contrôleur externe
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller, // Utilisez le contrôleur externe
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateX(widget.controller.value * math.pi),
          child: widget.controller.isAnimating
              ? widget.controller.value < 0.5
                  ? _previousChild
                  : Transform.flip(flipY: true, child: child)
              : child,
        );
      },
      child: widget.child,
    );
  }
}