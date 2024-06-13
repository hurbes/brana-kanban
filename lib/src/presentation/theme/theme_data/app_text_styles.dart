import 'package:brana/src/presentation/theme/theme_provider/app_theme.dart';
import 'package:flutter/material.dart';

class BranaTextStyles implements AppTextStyles {
  final AppFonts fonts;
  final AppColors colors;
  BranaTextStyles({required this.fonts, required this.colors});

  @override
  TextStyle get heading1 {
    return TextStyle(
      fontFamily: fonts.primary,
      fontWeight: FontWeight.bold,
      fontSize: 32,
      height: 40 / 32,
      color: colors.primaryAlternative,
    );
  }

  @override
  TextStyle get heading2 {
    return heading1.copyWith(
      fontSize: 28,
      height: 36 / 28,
      color: colors.primaryAlternative,
    );
  }

  @override
  TextStyle get heading3 {
    return heading1.copyWith(
      fontSize: 24,
      height: 32 / 24,
      color: colors.primaryAlternative,
    );
  }

  @override
  TextStyle get heading4 {
    return heading1.copyWith(
      fontSize: 20,
      height: 28 / 20,
      color: colors.primaryAlternative,
    );
  }

  @override
  TextStyle get heading5 {
    return heading1.copyWith(
      fontSize: 18,
      height: 26 / 18,
      color: colors.primaryAlternative,
    );
  }

  @override
  TextStyle get bodyRegular {
    return TextStyle(
      fontFamily: fonts.primary,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      height: 24 / 16,
    );
  }

  @override
  TextStyle get bodyBold {
    return bodyRegular.copyWith(
      fontWeight: FontWeight.bold,
    );
  }

  @override
  TextStyle get bodySmallRegular {
    return TextStyle(
      fontFamily: fonts.primary,
      fontWeight: FontWeight.normal,
      fontSize: 14,
      height: 20 / 14,
    );
  }

  @override
  TextStyle get bodySmallBold {
    return bodySmallRegular.copyWith(
      fontWeight: FontWeight.bold,
    );
  }

  @override
  TextStyle get button {
    return bodyBold.copyWith(
      fontSize: 16,
      height: 24 / 16,
    );
  }

  @override
  TextStyle get captionRegular {
    return TextStyle(
      fontFamily: fonts.primary,
      fontWeight: FontWeight.normal,
      fontSize: 12,
      height: 14 / 12,
    );
  }

  @override
  TextStyle get captionBold {
    return captionRegular.copyWith(
      fontWeight: FontWeight.bold,
    );
  }

  @override
  TextStyle get bodyMedium {
    return bodyRegular.copyWith(fontWeight: FontWeight.w500);
  }
}
