import 'package:flutter/material.dart';
import 'package:website_portofolio/widgets/animated_entrance.dart';
import 'package:website_portofolio/widgets/stat_card.dart';

import '../core/palette.dart';
import '../core/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      decoration: const BoxDecoration(gradient: Palette.heroGradient),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 48 : 96,
        horizontal: isMobile ? 24 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeadline(context),
                    const SizedBox(height: 32),
                    _buildAvatar(),
                    const SizedBox(height: 32),
                    _buildStats(isMobile),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _buildHeadline(context)),
                    const SizedBox(width: 40),
                    _buildAvatar(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildHeadline(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInUp(
          child: Text(
            "Hello, I’m",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 4),
        FadeInUp(
          child: Text(
            "DHIRSYA",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 24),
        FadeInLeft(
          child: SizedBox(
            width: 480,
            child: Text(
              "I am a Full Stack Developer with 8 years of development "
              "experience. Expertise spans JS/TS, React, Angular, Vue, "
              "Express, Laravel, PostgreSQL, and proficiency in AWS & Azure. "
              "Adapting rapidly and mastering new technologies, frameworks, "
              "and tools autonomously, even in the absence of hands-on supervision.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        const SizedBox(height: 32),
        _buildStats(false),
      ],
    );
  }

  Widget _buildAvatar() => Image.asset(
    'assets/head-avatar.webp',
    width: 320,
    height: 320,
    fit: BoxFit.cover,
  );

  Widget _buildStats(bool vertical) {
    final items = const [
      ("8 Y.", "Experience"),
      ("250+", "Project Completed"),
      ("550", "Happy Client"),
    ];

    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 24,
      runSpacing: 24,
      direction: vertical ? Axis.vertical : Axis.horizontal,
      children: items.map((e) => StatCard(value: e.$1, label: e.$2)).toList(),
    );
  }
}
