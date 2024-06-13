import 'package:brana/src/presentation/theme/theme_provider/app_theme.dart';
import 'package:flutter/material.dart';

class _AppSpacing {
  static const double baseUnit = 4;
  static const double tiny = baseUnit * 1;
  static const double small = baseUnit * 2;
  static const double medium = baseUnit * 3;
  static const double large = baseUnit * 6;
  static const double extraLarge = baseUnit * 10;
  static const double huge = baseUnit * 18;
}

class BranaVerticalSpacing implements AppSpacing {
  @override
  final tiny = const SizedBox(height: _AppSpacing.tiny);

  @override
  final small = const SizedBox(height: _AppSpacing.small);

  @override
  final medium = const SizedBox(height: _AppSpacing.medium);

  @override
  final large = const SizedBox(height: _AppSpacing.large);

  @override
  final extraLarge = const SizedBox(height: _AppSpacing.extraLarge);

  @override
  final huge = const SizedBox(height: _AppSpacing.huge);
}

class BranaHorizontalSpacing implements AppSpacing {
  @override
  final tiny = const SizedBox(width: _AppSpacing.tiny);

  @override
  final small = const SizedBox(width: _AppSpacing.small);

  @override
  final medium = const SizedBox(width: _AppSpacing.medium);

  @override
  final large = const SizedBox(width: _AppSpacing.large);

  @override
  final extraLarge = const SizedBox(width: _AppSpacing.extraLarge);

  @override
  final huge = const SizedBox(width: _AppSpacing.huge);
}
