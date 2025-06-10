import 'package:flutter/material.dart';

/// Tombol utama (filled / outlined) yang konsisten digunakan di seluruh site.
/// Gunakan `url_launcher` bila ingin membuka email / link eksternal.
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool filled;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: filled ? colors.primary : Colors.transparent,
        foregroundColor: filled ? Colors.white : colors.primary,
        elevation: filled ? 4 : 0,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: filled ? BorderSide.none : BorderSide(color: colors.primary),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
