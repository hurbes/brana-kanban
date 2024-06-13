import 'package:brana/src/presentation/theme/theme_data/app_colors.dart';
import 'package:brana/src/presentation/theme/theme_provider/app_theme.dart';

import 'add_elevated_button.dart';
import 'app_text_styles.dart';

import 'app_border_radius.dart';
import 'app_fonts.dart';
import 'app_gradients.dart';
import 'app_spacing.dart';
import 'app_text_field_styles.dart';
import 'app_theme_data.dart';

class BranaTheme extends AppTheme {
  @override
  AppBorderRadius get borderRadius => BranaBorderRadius();

  @override
  AppColors get colors => BranaColors();

  @override
  AppElevatedButtonTheme get elevatedButtonTheme {
    return BranaElevatedButtonTheme(
      borderRadius: borderRadius,
      colors: colors,
      textStyles: textStyles,
    );
  }

  @override
  AppFonts get fonts => BranaFonts();

  @override
  AppGradients get gradients => BranaGradients();

  @override
  AppSpacing get horizontalSpacing => BranaHorizontalSpacing();

  @override
  AppTextFieldStyles get textFieldStyles {
    return BranaTextFieldStyles(
      borderRadius: borderRadius,
      colors: colors,
      textStyles: textStyles,
    );
  }

  @override
  AppTextStyles get textStyles {
    return BranaTextStyles(fonts: fonts, colors: colors);
  }

  @override
  AppThemeData get theme {
    return BranaThemeData(
      borderRadius: borderRadius,
      colors: colors,
      elevatedButtonTheme: elevatedButtonTheme,
      fonts: fonts,
      textFieldStyles: textFieldStyles,
      textStyles: textStyles,
    );
  }

  @override
  AppSpacing get verticalSpacing => BranaVerticalSpacing();
}
