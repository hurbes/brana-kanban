import 'dart:ui';

import 'package:brana/src/presentation/theme/theme_provider/app_theme.dart';

class BranaColors implements AppColors {
  // Common Colors
  @override
  Color get primary => const Color(0xFFAF78FE);
  @override
  Color get primaryAlternative => const Color(0xFF361272);
  @override
  Color get secondary1 => const Color(0xFF361272);
  @override
  Color get secondary2 => const Color(0xFFDACFB9);
  @override
  Color get secondary3 => const Color(0xFFF7F0EE);
  @override
  Color get backgroundColor => const Color(0xFFFAF7F6);

  @override
  Color get white => backgroundColor;
  @override
  Color get greyVeryLight => const Color(0xFFEBEBEB);
  @override
  Color get greyLight => const Color(0xFF98A7AF);
  @override
  Color get greyMedium => const Color.fromRGBO(151, 151, 151, 1);
  @override
  Color get greyDark => const Color(0xFF333333);
  @override
  Color get greyVeryDark => const Color(0xFF1A1B1E);
  @override
  Color get black => const Color(0xFF333333);
  @override
  Color get blueLight => const Color(0xFF00C6D6);
  @override
  Color get transparent => const Color(0x00000000);

  @override
  Color get authenticationBackground => secondary2;
  @override
  Color get navigationItemBackground => const Color(0xFFFBFBFD);
  @override
  Color get inputPlaceholder => const Color(0xFFBDBDBD);
  @override
  Color get disabledInput => const Color(0xFFBDBDBD).withOpacity(0.2);
  @override
  Color get profileBackground => const Color(0xFFD8D8D8);

  // Alternative Buttons Colors
  @override
  Color get buttonDisabled => greyLight;
  @override
  Color get buttonDisabledText => white;
  @override
  Color get buttonEnabled => primary;
  @override
  Color get buttonEnabledText => white;
  @override
  Color get buttonPressed => black;

  @override
  Color get red => const Color(0xFFF76B52);

  @override
  Color get containerColor => const Color(0xFFF3E9E6);

  @override
  Color get containerTextColor => primary;

  @override
  List<Color> get gradientColors {
    return [const Color.fromRGBO(33, 81, 107, 0.6), primary];
  }

  @override
  Color get inActiveStrokeColor => const Color(0xFF7E90AD);

  @override
  Color get navBackgroundColor => const Color(0xFFD7F3E9);

  @override
  Color get navIconColor => primary;

  @override
  Color get navLabelColor => primary;

  @override
  Color get green => const Color(0xFFC7F8E0);

  @override
  Color get greenDark => const Color(0xFF048848);

  @override
  Color get yellow => const Color(0xFFFFF0D4);

  @override
  Color get yellowDark => const Color(0xFFE8AF3D);

  @override
  Color get primaryDark => const Color(0xFF361272);

  @override
  Color get greenLight => const Color(0xFF49E79A);

  @override
  Color get gold => const Color(0xFFCCBBA3);

  @override
  Color get goldLight => const Color(0xFFDDD4D1);

  @override
  Color get lavenderLight => const Color(0xFFEDDBFF);

  @override
  Color get lavenderGold => const Color(0xFFF5EDEB);

  @override
  Color get lavender => const Color(0xFFEDDBFF);

  @override
  Color get lavenderDark => const Color(0xFFF3E9E6);

  @override
  Color get lavender2 => const Color(0xFFFBF8F7);
}
