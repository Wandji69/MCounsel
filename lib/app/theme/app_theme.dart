import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  const seed = Color(0xFF2F5D50);
  final scheme = ColorScheme.fromSeed(seedColor: seed);
  final base = ThemeData(useMaterial3: true, colorScheme: scheme);
  final textTheme = base.textTheme;

  return base.copyWith(
    scaffoldBackgroundColor: const Color(0xFFF7F4EF),
    textTheme: textTheme.copyWith(
      bodyLarge: textTheme.bodyLarge?.copyWith(fontSize: 17, height: 1.45),
      bodyMedium: textTheme.bodyMedium?.copyWith(fontSize: 15, height: 1.4),
      titleLarge: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
    ),
  );
}
