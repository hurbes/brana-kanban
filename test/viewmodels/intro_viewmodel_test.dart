import 'package:brana/app/app.locator.dart';
import 'package:brana/app/app.router.dart';
import 'package:brana/ui/views/intro/intro_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('IntroViewModel -', () {
    late MockRouterService mockRouterService;
    late MockSharedPreferencesService mockSharedPreferencesService;

    setUp(() async {
      await registerServices();
      mockRouterService = getAndRegisterRouterService();
      mockSharedPreferencesService =
          await getAndRegisterSharedPreferencesService();
    });

    tearDown(() => locator.reset());

    test(
        'setStartUpCheck sets startUpCheck to true and navigates to parent view',
        () {
      final model = IntroViewModel();

      model.setStartUpCheck();

      verify(mockSharedPreferencesService.startUpCheck = true).called(1);
      verify(mockRouterService.replaceWithParentView()).called(1);
    });
  });
}
