import 'package:flutter/material.dart';

/// Pembungkus serba-guna dengan latar gradien + corner bundar.
/// Pakai di mana pun kamu butuh efek “card” ber-gradient.
class GradientBox extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;

  const GradientBox({
    super.key,
    required this.child,
    required this.gradient,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradient, borderRadius: borderRadius),
      padding: padding,
      child: child,
    );
  }
}
