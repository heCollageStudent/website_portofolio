import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_portofolio/core/palette.dart';
import 'package:website_portofolio/core/responsive.dart';
import 'package:website_portofolio/data/portofolio_data.dart';
import 'package:website_portofolio/widgets/portofolio_card.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      decoration: const BoxDecoration(gradient: Palette.oddSection),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 48 : 96,
          horizontal: isMobile ? 24 : 120,
        ),
        child: Column(
          children: [
            Text(
              'Portofolios',
              style: Theme.of(
                context,
              ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            GridView.builder(
              itemCount: portfolioData.length,
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // biar nggak scroll sendiri
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                final item = portfolioData[index];

                return PortofolioCard(
                  imagePath: item['image'] ?? '',
                  title: item['name'] ?? '',
                  category: item['category'] ?? '',
                  tags: List<String>.from(item['tags'] ?? []),
                  onView: () => launchUrl(Uri.parse(item['url'] ?? '')),
                  description: item['description'] ?? '',
                  features:
                      (item['features'] != null && item['features'] is List)
                      ? (item['features'] as List)
                            .map((e) => e.toString())
                            .toList()
                      : [],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
