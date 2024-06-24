import 'package:brana/app/app.locator.dart';
import 'package:brana/app/app.router.dart';
import 'package:brana/ui/views/parent/parent_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:easy_localization/easy_localization.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('ParentViewModel -', () {
    late MockRouterService mockRouterService;

    setUp(() async {
      await registerServices();
      mockRouterService = getAndRegisterRouterService();
    });

    tearDown(() => locator.reset());

    test('navigateToSettings calls router service', () {
      final model = ParentViewModel();

      model.navigateToSettings();

      verify(mockRouterService.navigateToSettingsView()).called(1);
    });

    test('title returns correct title based on currentIndex', () {
      final model = ParentViewModel();

      model.setIndex(0);
      expect(model.title, 'brana_title'.tr());

      model.setIndex(1);
      expect(model.title, 'history_title'.tr());

      model.setIndex(2);
      expect(model.title, 'default_title'.tr());
    });

    test('subtitle returns correct subtitle based on currentIndex', () {
      final model = ParentViewModel();

      model.setIndex(0);
      expect(model.subtitle, 'brana_subtitle'.tr());

      model.setIndex(1);
      expect(model.subtitle, 'history_subtitle'.tr());

      model.setIndex(2);
      expect(model.subtitle, 'default_subtitle'.tr());
    });
  });
}
