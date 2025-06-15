import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/palette.dart';
import '../core/responsive.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fade;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fade = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      decoration: const BoxDecoration(gradient: Palette.contactGradient),
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
          child: FadeTransition(
            opacity: _fade,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 48),
                  Text(
                    'Contact Me',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: _SocialBoxGrid(isMobile: isMobile),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
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

class _SocialBox extends StatefulWidget {
  final IconData icon;
  final String url;
  final String label;

  const _SocialBox({
    required this.icon,
    required this.url,
    required this.label,
  });

  @override
  State<_SocialBox> createState() => _SocialBoxState();
}

class _SocialBoxState extends State<_SocialBox> {
  bool isHovering = false;

  Color get _bgColor {
    if (!isHovering) return Colors.white;
    if (widget.label == 'LinkedIn') return Colors.blue;
    if (widget.label == 'Github') return Colors.black;
    if (widget.label == 'Email') return Colors.red.shade700;

    return Colors.grey;
  }

  Color get _contentColor {
    return isHovering ? Colors.white : Colors.black87;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: isHovering ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: InkWell(
          onTap: () => launchUrl(Uri.parse(widget.url)),
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: _bgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(widget.icon, color: _contentColor, size: 28),
                const SizedBox(height: 12),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: _contentColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
