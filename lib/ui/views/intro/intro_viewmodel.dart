import 'package:brana/app/app.locator.dart';
import 'package:brana/app/app.router.dart';
import 'package:brana/core/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class IntroViewModel extends BaseViewModel {
  final _navigationService = locator<RouterService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();

  void setStartUpCheck() {
    _sharedPreferencesService.startUpCheck = true;
    _navigationService.replaceWithParentView();
  }
}
