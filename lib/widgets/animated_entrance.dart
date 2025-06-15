import 'package:flutter/material.dart';

/// Fade-in dari bawah ke atas (offset Y positif → 0)
class FadeInUp extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double offset;

  const FadeInUp({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.offset = 40,
  });

  @override
  State<FadeInUp> createState() => _FadeInUpState();
}

class _FadeInUpState extends State<FadeInUp>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _position;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _position = Tween<Offset>(
      begin: Offset(0, widget.offset / 100), // dari bawah
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    return _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => Opacity(
        opacity: _opacity.value,
        child: Transform.translate(
          offset: _position.value * 100,
          child: widget.child,
        ),
      ),
    );
  }
}

/// Fade-in dari kiri ke kanan (offset X negatif → 0)
class FadeInLeft extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Curve curve;

  const FadeInLeft({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.offset = 30,
    this.curve = Curves.easeOut,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: Offset(-offset, 0), end: Offset.zero),
      duration: duration,
      curve: curve,
      builder: (context, Offset value, child) {
        return Transform.translate(
          offset: value,
          child: AnimatedOpacity(
            duration: duration,
            opacity: value == Offset.zero ? 1.0 : 0.0,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

/// Fade-in dengan efek scale (zoom in)
class FadeInScale extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double beginScale;
  final Curve curve;

  const FadeInScale({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.beginScale = 0.8,
    this.curve = Curves.easeOut,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: beginScale, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: AnimatedOpacity(
            duration: duration,
            opacity: scale == 1.0 ? 1.0 : 0.0,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
