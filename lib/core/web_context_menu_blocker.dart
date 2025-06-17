// lib/web_context_menu_blocker.dart
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void disableContextMenu() {
  html.document.onContextMenu.listen((event) => event.preventDefault());
}
