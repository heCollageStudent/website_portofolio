import 'package:flutter/material.dart';
import 'package:website_portofolio/widgets/porto_detail_content.dart';

class PortofolioCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String category;
  final String description;
  final List<String> tags;
  final VoidCallback onView;
  final List<String> features;

  const PortofolioCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.tags,
    required this.onView,
    required this.category,
    required this.features,
  });

  @override
  State<PortofolioCard> createState() => _PortofolioCardState();
}

class _PortofolioCardState extends State<PortofolioCard> {
  bool showAllTags = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const int maxTagsShown = 3;
    final allTags = widget.tags.map((e) => e.trim()).toList();
    final visibleTags = showAllTags
        ? allTags
        : allTags.take(maxTagsShown).toList();
    final int hiddenCount = allTags.length - visibleTags.length;

    return SizedBox(
      height: 400,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 10,
        color: Color.fromARGB(255, 243, 249, 255),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 3.2 / 2,
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        ...visibleTags.map(
                          (tag) => Chip(
                            label: Text(
                              tag,
                              style: const TextStyle(fontSize: 9),
                            ),
                            backgroundColor:
                                theme.colorScheme.surfaceContainerHighest,
                            shape: const StadiumBorder(),
                            side: BorderSide.none,
                            labelPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          ),
                        ),
                        if (!showAllTags && hiddenCount > 0)
                          GestureDetector(
                            onTap: () => setState(() => showAllTags = true),
                            child: Chip(
                              label: Text('+$hiddenCount more'),
                              backgroundColor: Colors.grey.shade300,
                              shape: const StadiumBorder(),
                              side: BorderSide.none,
                              labelStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              labelPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: () => showPortfolioDetailDialog(
                        context: context,
                        imagePath: widget.imagePath,
                        title: widget.title,
                        category: widget.category,
                        description: widget.description,
                        tags: widget.tags,
                        features: widget.features,
                        onViewCode: widget.onView,
                      ),
                      icon: const Icon(Icons.arrow_forward, size: 16),
                      label: const Text("View Details"),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        textStyle: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
