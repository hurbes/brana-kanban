import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeProvider extends InheritedWidget {
  final Widget widget;
  final AppTheme theme;

  const AppThemeProvider({
    Key? key,
    required this.widget,
    required this.theme,
  }) : super(child: widget, key: key);

  @override
  bool updateShouldNotify(covariant AppThemeProvider oldWidget) {
    return false;
  }

  static AppTheme of(BuildContext context) {
    final appThemeProvider =
        context.dependOnInheritedWidgetOfExactType<AppThemeProvider>();

    if (appThemeProvider == null) {
      throw "Unable to find AppThemeProvider. Make Sure you wrapped your Material App with AppThemeProvider";
    }

    return appThemeProvider.theme;
  }
}
