import 'package:flutter_test/flutter_test.dart';
import 'package:brana/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AnalyticsServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
