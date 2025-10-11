import 'package:flutter/material.dart';

class AppSpacing {
  const AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

class AppRadius {
  const AppRadius._();

  static const BorderRadius sm = BorderRadius.all(Radius.circular(8));
  static const BorderRadius md = BorderRadius.all(Radius.circular(16));
  static const BorderRadius pill = BorderRadius.all(Radius.circular(999));
}

class AppBreakpoints {
  const AppBreakpoints._();

  static const double mobile = 320;
  static const double tablet = 768;
  static const double desktop = 1280;
}

class AppTypography {
  const AppTypography._();

  static TextTheme textTheme(ColorScheme scheme) => TextTheme(
        headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          color: scheme.onBackground,
        ),
        bodyLarge: TextStyle(color: scheme.onBackground),
        bodyMedium: TextStyle(color: scheme.onBackground.withOpacity(0.9)),
        labelLarge: TextStyle(color: scheme.onPrimary),
      );
}
