import 'package:flutter/material.dart';

void showPortfolioDetailDialog({
  required BuildContext context,
  required String imagePath,
  required String title,
  required String category,
  required String description,
  required List<String> tags,
  required List<String> features,
  required VoidCallback onViewCode,
}) {
  final theme = Theme.of(context);

  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar
                // Expanded(
                //   flex: 5,
                //   child: AspectRatio(
                //     aspectRatio: 4 / 3,
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(12),
                //       child: Image.asset(
                //         imagePath,
                //         fit: BoxFit.cover,
                //         errorBuilder: (_, __, ___) =>
                //             const Center(child: Icon(Icons.broken_image)),
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(width: 24),
                // Konten
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        category,
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(description, style: theme.textTheme.bodyMedium),
                      const SizedBox(height: 16),
                      if (features.isNotEmpty) ...[
                        Row(
                          children: [
                            const Icon(Icons.check_circle_outline, size: 16),
                            const SizedBox(width: 6),
                            Text(
                              "Key Features:",
                              style: theme.textTheme.titleSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        ...features.map(
                          (f) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              '• $f',
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: tags
                            .map(
                              (tag) => Chip(
                                label: Text(tag),
                                shape: const StadiumBorder(),
                                side: BorderSide.none,
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: onViewCode,
                            icon: const Icon(Icons.code),
                            label: const Text("View Code"),
                          ),
                          const SizedBox(width: 12),
                          OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Close"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
