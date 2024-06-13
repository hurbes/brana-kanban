import 'package:brana/src/presentation/theme/theme_provider/app_theme.dart';

import 'package:flutter/material.dart';

class BranaElevatedButtonTheme implements AppElevatedButtonTheme {
  final AppBorderRadius borderRadius;
  final AppColors colors;
  final AppTextStyles textStyles;

  BranaElevatedButtonTheme({
    required this.borderRadius,
    required this.colors,
    required this.textStyles,
  });

  @override
  ElevatedButtonThemeData get normal {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: borderRadius.normal,
        )),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return colors.buttonPressed;
            }
            if (states.contains(MaterialState.disabled)) return colors.greyDark;
            return colors.primary;
          },
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 36,
        )),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return colors.greyMedium;
            }
            return colors.greyDark;
          },
        ),
        textStyle: MaterialStateProperty.all(textStyles.bodyBold),
      ),
    );
  }
}
