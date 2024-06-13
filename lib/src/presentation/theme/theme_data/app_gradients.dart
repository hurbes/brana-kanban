import 'dart:ui';

import 'package:brana/src/presentation/theme/theme_provider/app_theme.dart';

class BranaGradients implements AppGradients {
  @override
  List<Color> get blue => [const Color(0xFF62D1E5), const Color(0xFF0D5866)];
  @override
  List<Color> get green => [const Color(0xFF39F2AF), const Color(0xFF1C8D5E)];
  @override
  List<Color> get red => [const Color(0xFFEE3B5C), const Color(0xFF890F26)];
}
