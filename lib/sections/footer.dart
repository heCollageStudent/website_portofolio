import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      color: Colors.black87,
      width: double.infinity,
      child: Center(
        child: Text(
          '© 2025 Dhirsya Ramadhan Pattah. All rights reserved.',
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ),
    );
  }
}
