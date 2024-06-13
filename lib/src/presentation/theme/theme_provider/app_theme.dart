import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

abstract class AppTheme {
  AppScreen screen = AppScreen();

  AppColors get colors;
  AppGradients get gradients;
  AppFonts get fonts;
  AppBorderRadius get borderRadius;
  AppTextStyles get textStyles;
  AppTextFieldStyles get textFieldStyles;
  AppElevatedButtonTheme get elevatedButtonTheme;
  AppThemeData get theme;
  AppSpacing get verticalSpacing;
  AppSpacing get horizontalSpacing;
}

abstract class AppColors {
  Color get lavender2;
  Color get lavenderDark;
  Color get lavender;
  Color get lavenderLight;
  Color get lavenderGold;
  Color get primaryAlternative;
  Color get secondary1;
  Color get secondary2;
  Color get secondary3;
  Color get backgroundColor;

  Color get authenticationBackground;
  Color get navigationItemBackground;
  Color get profileBackground;

  Color get primary;
  Color get white;
  Color get greyVeryLight;
  Color get greyLight;
  Color get greyMedium;
  Color get greyDark;
  Color get greyVeryDark;
  Color get black;
  Color get blueLight;
  Color get transparent;
  Color get red;

  Color get inputPlaceholder;
  Color get disabledInput;

  Color get buttonDisabled;
  Color get buttonDisabledText;
  Color get buttonEnabled;
  Color get buttonEnabledText;
  Color get buttonPressed;

  List<Color> get gradientColors;
  Color get containerColor;
  Color get inActiveStrokeColor;
  Color get containerTextColor;

  Color get navBackgroundColor;
  Color get navIconColor;
  Color get navLabelColor;

  Color get yellow;
  Color get yellowDark;

  Color get green;
  Color get greenDark;
  Color get greenLight;

  Color get primaryDark;
  Color get gold;
  Color get goldLight;
}

abstract class AppGradients {
  List<Color> get red;
  List<Color> get green;
  List<Color> get blue;
}

abstract class AppBorderRadius {
  BorderRadius get small;
  BorderRadius get normal;
  BorderRadius get large;
}

abstract class AppFonts {
  String get primary;
  String get secondary;
}

abstract class AppTextFieldStyles {
  InputDecorationTheme get normal;
  UnderlineInputBorder get underlineInputBorder;
}

abstract class AppTextStyles {
  TextStyle get heading1;
  TextStyle get heading2;
  TextStyle get heading3;
  TextStyle get heading4;
  TextStyle get heading5;
  TextStyle get bodyRegular;
  TextStyle get bodyBold;
  TextStyle get bodyMedium;
  TextStyle get bodySmallRegular;
  TextStyle get bodySmallBold;
  TextStyle get button;
  TextStyle get captionRegular;
  TextStyle get captionBold;
}

abstract class AppElevatedButtonTheme {
  ElevatedButtonThemeData get normal;
}

abstract class AppThemeData {
  ThemeData get data;
}

abstract class AppSpacing {
  SizedBox get tiny;
  SizedBox get small;
  SizedBox get medium;
  SizedBox get large;
  SizedBox get extraLarge;
  SizedBox get huge;
}

class AppScreen {
  Size _size = const Size(0, 0);

  DeviceScreenType _type = DeviceScreenType.tablet;

  Size get size => _size;

  DeviceScreenType get type => _type;

  void setSize(Size size) {
    _size = size;
  }

  void setType(DeviceScreenType type) {
    _type = type;
  }

  double getHeightPercentage([double percentageOf = 0]) {
    return size.height * percentageOf;
  }

  double getHeightFraction({
    int dividedBy = 1,
    double offsetBy = 0,
    double max = 3000,
  }) {
    return min((size.height - offsetBy) / dividedBy, max);
  }

  double getWidthPercentage([double percentageOf = 0]) {
    return size.width * percentageOf;
  }

  double getWidthFraction({
    double dividedBy = 1,
    double offsetBy = 0,
    double max = 3000,
  }) {
    return min((size.width - offsetBy) / dividedBy, max);
  }
}
