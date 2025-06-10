import 'package:dynamic_path_url_strategy/dynamic_path_url_strategy.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:website_portofolio/core/route.dart';
import 'core/palette.dart';
import 'sections/header.dart';
import 'sections/hero.dart';

void main() {
  setPathUrlStrategy();
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
    'about': GlobalKey(),
    'process': GlobalKey(),
    'experience': GlobalKey(),
    'portfolio': GlobalKey(),
    'skills': GlobalKey(),
    'blog': GlobalKey(),
    'services': GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(activeId: activeId),
      ),
      body: SingleChildScrollView(
        controller: _scrollC,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            _Wrap(key: _keys['home'], child: const HeroSection()),
            // AboutSection(),
            // ExperienceSection(),
            // PortfolioSection(),
            // dll…
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
