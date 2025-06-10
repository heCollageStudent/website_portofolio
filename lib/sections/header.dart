import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/palette.dart';
import '../core/responsive.dart';
import '../widgets/primary_button.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key, required this.activeId});

  /// id section yang sedang aktif –> dipakai untuk highlight menu
  final String activeId;

  /// Daftar menu (teks, id anchor)
  static const List<(String text, String id)> _menus = [
    ('Home', 'home'),
    ('About', 'about'),
    ('Process', 'process'),
    ('Experience', 'experience'),
    ('Portfolio', 'portfolio'),
    ('Skills', 'skills'),
    ('Blog', 'blog'),
    ('Services', 'services'),
  ];

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? _DesktopHeader(menus: _menus, activeId: activeId)
        : _MobileHeader(menus: _menus, activeId: activeId);
  }
}

/* -------------------------------------------------------------------------- */
/*                                DESKTOP BAR                                 */
/* -------------------------------------------------------------------------- */

class _DesktopHeader extends StatelessWidget {
  const _DesktopHeader({required this.menus, required this.activeId});

  final List<(String, String)> menus;
  final String activeId;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0.9),
      elevation: 0,
      titleSpacing: 32,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFF7B3FFF),
            child: Text('N', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 10),
          Text(
            'Nemanja',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      actions: [
        for (final item in menus)
          TextButton(
            onPressed: () => context.go('/?s=${item.$2}'),
            style: TextButton.styleFrom(
              foregroundColor: activeId == item.$2
                  ? Palette.primary
                  : Colors.black87,
            ),
            child: Text(item.$1),
          ),
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(right: 32),
          child: PrimaryButton(
            label: 'Contact',
            onPressed: () =>
                launchUrl(Uri.parse('mailto:hello@yourdomain.com')),
          ),
        ),
      ],
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                 MOBILE BAR                                 */
/* -------------------------------------------------------------------------- */

class _MobileHeader extends StatelessWidget {
  const _MobileHeader({required this.menus, required this.activeId});

  final List<(String, String)> menus;
  final String activeId;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFF7B3FFF),
            child: Text('N', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          const Text('Nemanja', style: TextStyle(color: Colors.black87)),
        ],
      ),
      iconTheme: const IconThemeData(color: Colors.black87),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu),
          onSelected: (value) {
            if (value == 'contact') {
              launchUrl(Uri.parse('mailto:hello@yourdomain.com'));
            } else {
              context.go('/?s=$value');
            }
          },
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
            const PopupMenuDivider(),
            const PopupMenuItem(value: 'contact', child: Text('Contact')),
          ],
        ),
      ],
    );
  }
}
