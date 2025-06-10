import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:website_portofolio/main.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          const PortfolioHome(initialSection: null), // ← lihat langkah 3
    ),
  ],
  errorBuilder: (_, __) =>
      const Scaffold(body: Center(child: Text('404 – Not Found'))),
);
