import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext c) =>
      MediaQuery.of(c).size.width < 600;
  static bool isTablet(BuildContext c) =>
      MediaQuery.of(c).size.width >= 600 &&
      MediaQuery.of(c).size.width < 1024;
  static bool isDesktop(BuildContext c) =>
      MediaQuery.of(c).size.width >= 1024;
}