import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';

class ParentViewModel extends IndexTrackingViewModel {
  void navigateToSettings() {}

  String get title {
    switch (currentIndex) {
      case 0:
        return 'brana_title'.tr();
      case 1:
        return 'history_title'.tr();
      default:
        return 'default_title'.tr();
    }
  }

  String get subtitle {
    switch (currentIndex) {
      case 0:
        return 'brana_subtitle'.tr();
      case 1:
        return 'history_subtitle'.tr();
      default:
        return 'default_subtitle'.tr();
    }
  }
}
