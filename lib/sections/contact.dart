import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/palette.dart';
import '../core/responsive.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(gradient: Palette.contactGradient),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Contact Me',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: _SocialBoxGrid(isMobile: isMobile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialBoxGrid extends StatelessWidget {
  const _SocialBoxGrid({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: isMobile ? 1 : 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1,
      children: const [
        _SocialBox(
          icon: FontAwesomeIcons.linkedinIn,
          label: 'LinkedIn',
          url: 'https://linkedin.com/in/dhirsyarp',
        ),
        _SocialBox(
          icon: FontAwesomeIcons.github,
          label: 'Github',
          url: 'https://github.com/dhirsyaram',
        ),
        _SocialBox(
          icon: FontAwesomeIcons.envelope,
          label: 'Email',
          url: 'mailto:dhirsyaramadhanpattah02@gmail.com',
        ),
      ],
    );
  }
}

class _SocialBox extends StatelessWidget {
  final IconData icon;
  final String url;
  final String label;

  const _SocialBox({
    required this.icon,
    required this.url,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 22,
              offset: Offset(0, 12),
              color: Colors.black12,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, color: Colors.black, size: 24),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
