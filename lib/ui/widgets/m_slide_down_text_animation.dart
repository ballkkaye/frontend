import 'package:flutter/material.dart';

class MSlideDownTextAnimation extends StatefulWidget {
  final Widget child;

  const MSlideDownTextAnimation({
    super.key,
    required this.child,
  });

  @override
  State<MSlideDownTextAnimation> createState() =>
      _MSlideDownTextAnimationState();
}

class _MSlideDownTextAnimationState extends State<MSlideDownTextAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );

    _offsetAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset(0, -1),
          end: Offset(0, 0),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: ConstantTween<Offset>(Offset.zero),
        weight: 80,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset(0, 0),
          end: Offset(0, 1),
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 40,
      ),
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
      ),
    );
  }
}
