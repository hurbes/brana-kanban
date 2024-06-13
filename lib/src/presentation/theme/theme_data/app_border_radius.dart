import 'package:brana/src/presentation/theme/theme_provider/app_theme.dart';
import 'package:flutter/material.dart';

class BranaBorderRadius implements AppBorderRadius {
  @override
  BorderRadius get small => BorderRadius.circular(4);

  @override
  BorderRadius get normal => BorderRadius.circular(8);

  @override
  BorderRadius get large => BorderRadius.circular(16);
}
