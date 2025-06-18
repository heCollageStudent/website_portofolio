import 'package:flutter/material.dart';
import 'package:website_portofolio/core/palette.dart';
import 'package:website_portofolio/core/responsive.dart';
import 'package:website_portofolio/data/certification_data.dart';
import 'package:website_portofolio/widgets/certif_card.dart';

class CertificateSection extends StatelessWidget {
  final List<CertificateData> certificates;

  const CertificateSection({super.key, required this.certificates});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      decoration: const BoxDecoration(gradient: Palette.evenSection),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 48 : 96,
          horizontal: isMobile ? 24 : 120,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Certificates',
              style: Theme.of(
                context,
              ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth > 900
                    ? 3
                    : constraints.maxWidth > 600
                    ? 2
                    : 1;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: certificates.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.6,
                  ),
                  itemBuilder: (context, index) {
                    final cert = certificates[index];
                    return CertificateCard(
                      imageUrl: cert.imageUrl,
                      title: cert.title,
                      description: cert.description,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
