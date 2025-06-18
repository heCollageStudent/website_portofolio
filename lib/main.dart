import 'package:dynamic_path_url_strategy/dynamic_path_url_strategy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:website_portofolio/core/route.dart';
import 'package:website_portofolio/core/palette.dart';
import 'package:website_portofolio/core/web_context_menu_blocker.dart';
import 'package:website_portofolio/data/certification_data.dart';
import 'package:website_portofolio/sections/certifications.dart';
import 'package:website_portofolio/sections/contact.dart';
import 'package:website_portofolio/sections/education_experience.dart';
import 'package:website_portofolio/sections/footer.dart';
import 'package:website_portofolio/sections/header.dart';
import 'package:website_portofolio/sections/hero.dart';
import 'package:website_portofolio/sections/portofolios.dart';

void main() {
  setPathUrlStrategy();
  if (kIsWeb) disableContextMenu();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Dirsa – Portfolio',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Palette.bg,
      ),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key, this.initialSection});
  final String? initialSection;

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  String activeId = 'home';

  final _scrollC = ScrollController();
  final Map<String, GlobalKey> _keys = {
    'home': GlobalKey(),
    'experience': GlobalKey(),
    'portofolio': GlobalKey(),
    'certificate': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollC.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialSection != null &&
          _keys.containsKey(widget.initialSection)) {
        _scrollToSection(widget.initialSection!);
      }
    });
  }

  void _onScroll() {
    for (final entry in _keys.entries) {
      final context = entry.value.currentContext;
      if (context == null) continue;

      final box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero).dy;

      if (position < 150 && position > -box.size.height / 2) {
        if (activeId != entry.key) {
          setState(() => activeId = entry.key);
        }
        break;
      }
    }
  }

  void _scrollToSection(String id) {
    final context = _keys[id]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.1,
      );
      setState(() {
        activeId = id;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Header(activeId: activeId, onSectionSelected: _scrollToSection),
      ),
      body: SingleChildScrollView(
        controller: _scrollC,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            _Wrap(key: _keys['home'], child: const HeroSection()),
            _Wrap(
              key: _keys['experience'],
              child: const EducationExperienceSection(),
            ),
            _Wrap(key: _keys['portofolio'], child: const PortfolioSection()),
            _Wrap(
              key: _keys['certificate'],
              child: CertificateSection(
                certificates: [
                  CertificateData(
                    imageUrl: 'assets/certif/certif-bnsp-mobile.webp',
                    title: 'Junior Mobile Programmer',
                    description:
                        'Badan Nasional Sertifikasi Profesi (BNSP) • Okt 2024',
                  ),
                  CertificateData(
                    imageUrl: 'assets/certif/certif-dev-mobile.webp',
                    title: 'Android Dev Certification',
                    description:
                        'Dev Certification for Android (DCA) • Jan 2025',
                  ),
                  CertificateData(
                    imageUrl: 'assets/certif/certif-bangkit.webp',
                    title: 'Certificate of Completion - Distinction Graduate',
                    description: 'Bangkit Academy • Jul 2024',
                  ),
                  CertificateData(
                    imageUrl: 'assets/certif/certif-android-inter.webp',
                    title: 'Intermediate Android Application Development',
                    description: 'Dicoding Indonesia • May 2024',
                  ),
                  CertificateData(
                    imageUrl: 'assets/certif/certif-funda-android.webp',
                    title: 'Fundamentals of Android Application Development',
                    description: 'Dicoding Indonesia • Mar 2024',
                  ),
                  CertificateData(
                    imageUrl: 'assets/certif/certif-ml-android.webp',
                    title: 'Application of Machine Learning for Android',
                    description: 'Dicoding Indonesia • Apr 2024',
                  ),
                ],
              ),
            ),
            _Wrap(key: _keys['contact'], child: const ContactSection()),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class _Wrap extends StatelessWidget {
  const _Wrap({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}
