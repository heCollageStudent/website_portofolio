import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../core/palette.dart';
import '../core/responsive.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    required this.activeId,
    required this.onSectionSelected,
  });

  final String activeId;
  final void Function(String id) onSectionSelected;

  static const List<(String text, String id)> _menus = [
    ('Home', 'home'),
    ('Experience', 'experience'),
    ('Portfolio', 'portfolio'),
    ('Skills', 'skills'),
    ('Services', 'services'),
    ('Contact', 'contact'),
  ];

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? _DesktopHeader(
            menus: _menus,
            activeId: activeId,
            onSectionSelected: onSectionSelected,
          )
        : _MobileHeader(
            menus: _menus,
            activeId: activeId,
            onSectionSelected: onSectionSelected,
          );
  }
}

class _DesktopHeader extends StatelessWidget {
  const _DesktopHeader({
    required this.menus,
    required this.activeId,
    required this.onSectionSelected,
  });

  final List<(String, String)> menus;
  final String activeId;
  final void Function(String id) onSectionSelected;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              border: const Border(
                bottom: BorderSide(color: Colors.white24, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo kiri
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.black,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: 'assets/head-avatar.jpg',
                          fit: BoxFit.cover,
                          placeholder: (_, __) =>
                              const CircularProgressIndicator.adaptive(),
                          errorWidget: (_, __, ___) => const Icon(Icons.person),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "DIRFO",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                // Menu kanan
                Row(
                  children: [
                    for (final item in menus)
                      InkWell(
                        onTap: () => onSectionSelected(item.$2),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item.$1,
                                style: TextStyle(
                                  color: activeId == item.$2
                                      ? Colors.black
                                      : Colors.black87,
                                  fontWeight: activeId == item.$2
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 4),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: 2,
                                width: activeId == item.$2 ? 24 : 0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileHeader extends StatelessWidget {
  const _MobileHeader({
    required this.menus,
    required this.activeId,
    required this.onSectionSelected,
  });

  final List<(String, String)> menus;
  final String activeId;
  final void Function(String id) onSectionSelected;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.black,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: "assets/head-avatar.jpg",
                fit: BoxFit.cover,
                width: 36,
                height: 36,
                placeholder: (_, __) =>
                    const CircularProgressIndicator.adaptive(),
                errorWidget: (_, __, ___) => const Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text('DIRFO', style: TextStyle(color: Colors.black87)),
        ],
      ),
      iconTheme: const IconThemeData(color: Colors.black87),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu),
          onSelected: onSectionSelected,
          itemBuilder: (_) => [
            ...menus.map(
              (e) => PopupMenuItem(
                value: e.$2,
                child: Text(
                  e.$1,
                  style: TextStyle(
                    color: activeId == e.$2 ? Palette.primary : Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
