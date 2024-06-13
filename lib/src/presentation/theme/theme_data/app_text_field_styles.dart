import 'package:brana/src/presentation/theme/theme_provider/app_theme.dart';
import 'package:flutter/material.dart';

class BranaTextFieldStyles implements AppTextFieldStyles {
  final AppBorderRadius borderRadius;
  final AppColors colors;
  final AppTextStyles textStyles;

  BranaTextFieldStyles({
    required this.borderRadius,
    required this.colors,
    required this.textStyles,
  });

  OutlineInputBorder get border => OutlineInputBorder(
        borderRadius: borderRadius.normal,
      );

  @override
  InputDecorationTheme get normal {
    return InputDecorationTheme(
      border: underlineInputBorder,
      contentPadding: const EdgeInsets.all(0),
      disabledBorder: underlineInputBorder,
      enabledBorder: underlineInputBorder,
      fillColor: colors.white,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedBorder: underlineInputBorder,
      labelStyle: textStyles.bodyRegular.copyWith(
        color: colors.inputPlaceholder,
      ),
    );
  }

  @override
  UnderlineInputBorder get underlineInputBorder {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: colors.greyVeryLight),
    );
  }
}
