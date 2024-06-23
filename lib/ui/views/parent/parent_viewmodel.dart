import 'package:stacked/stacked.dart';

class ParentViewModel extends IndexTrackingViewModel {
  void navigateToSettings() {}

  String get title {
    switch (currentIndex) {
      case 0:
        return 'Brana';
      case 1:
        return 'History';
      default:
        return 'Brana';
    }
  }

  String get subtitle {
    switch (currentIndex) {
      case 0:
        return 'Best platform for creating to-do lists';
      case 1:
        return 'Find all your completed tasks here';
      default:
        return 'Welcome to Brana';
    }
  }
}
