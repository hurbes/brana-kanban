import 'package:brana/app/app.locator.dart';
import 'package:brana/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stacked_services/stacked_services.dart';

class ParentViewModel extends IndexTrackingViewModel {
  final _routerService = locator<RouterService>();

  void navigateToSettings() {
    _routerService.navigateToSettingsView();
  }

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
