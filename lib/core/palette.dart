import 'package:flutter/material.dart';

class Palette {
  static const Color primary = Color(0xFF7B3FFF); // ungu
  static const Color secondary = Color(0xFF35D0FF); // cyan
  static const Color bg = Color(0xFFF9F9FF);

  static const Color dustyBlue = Color.fromARGB(255, 217, 234, 253);
  static const Color grayLight = Color.fromARGB(255, 243, 242, 242);

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [dustyBlue, bg, grayLight, dustyBlue],
  );
  static const LinearGradient experienceGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [dustyBlue, bg, bg, bg, grayLight, grayLight, grayLight, dustyBlue],
  );
  static const LinearGradient contactGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [dustyBlue, bg, grayLight, dustyBlue],
  );
}
