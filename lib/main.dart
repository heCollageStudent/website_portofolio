import 'package:dynamic_path_url_strategy/dynamic_path_url_strategy.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:website_portofolio/core/route.dart';
import 'package:website_portofolio/core/palette.dart';
import 'package:website_portofolio/sections/contact.dart';
import 'package:website_portofolio/sections/header.dart';
import 'package:website_portofolio/sections/hero.dart';

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
    'contact': GlobalKey(),
    'experience': GlobalKey(),
    'portfolio': GlobalKey(),
    'skills': GlobalKey(),
    'blog': GlobalKey(),
    'services': GlobalKey(),
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
            _Wrap(key: _keys['contact'], child: const ContactSection()),
            // Tambah section lain di sini jika ada...
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
