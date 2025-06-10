import 'package:flutter/material.dart';

class Palette {
  static const Color primary   = Color(0xFF7B3FFF); // ungu
  static const Color secondary = Color(0xFF35D0FF); // cyan
  static const Color bg        = Color(0xFFF9F9FF);

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );
}
