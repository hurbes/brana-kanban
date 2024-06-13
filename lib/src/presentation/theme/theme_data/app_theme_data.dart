import 'package:brana/src/presentation/theme/theme_provider/app_theme.dart';
import 'package:flutter/material.dart';

class BranaThemeData extends AppThemeData {
  final AppBorderRadius borderRadius;
  final AppColors colors;
  final AppElevatedButtonTheme elevatedButtonTheme;
  final AppFonts fonts;
  final AppTextFieldStyles textFieldStyles;
  final AppTextStyles textStyles;

  BranaThemeData({
    required this.borderRadius,
    required this.colors,
    required this.elevatedButtonTheme,
    required this.fonts,
    required this.textFieldStyles,
    required this.textStyles,
  });

  @override
  ThemeData get data {
    return ThemeData(
      brightness: Brightness.light,
      canvasColor: colors.transparent,
      cardTheme: CardTheme(
        color: colors.greyDark,
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: borderRadius.normal),
      ),
      elevatedButtonTheme: elevatedButtonTheme.normal,
      fontFamily: fonts.primary,
      primaryColor: colors.primary,
      inputDecorationTheme: textFieldStyles.normal,
      scaffoldBackgroundColor: colors.greyLight,
      textTheme: TextTheme(
        titleMedium: textStyles.bodyRegular.copyWith(color: colors.black),
      ),
    );
  }
}
