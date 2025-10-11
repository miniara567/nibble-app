import 'package:flutter/material.dart';

import 'tokens.dart';

ThemeData buildLightTheme() {
  const seedColor = Color(0xFFEC5F5F);
  final colorScheme = ColorScheme.fromSeed(seedColor: seedColor);

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: AppTypography.textTheme(colorScheme),
    scaffoldBackgroundColor: colorScheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
      elevation: 0,
      margin: const EdgeInsets.all(AppSpacing.md),
    ),
  );
}
