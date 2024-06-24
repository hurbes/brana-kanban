import 'package:brana/app/app.locator.dart';
import 'package:brana/ui/bottom_sheets/date_picker/date_picker_sheet_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('DatePickerSheetModel -', () {
    late MockBottomSheetService mockBottomSheetService;

    setUp(() async {
      await registerServices();
      mockBottomSheetService = getAndRegisterBottomSheetService();
    });

    tearDown(() => locator.reset());

    test('onDateChanged - sets selected date and rebuilds UI', () {
      final model = DatePickerSheetModel();
      final date = DateTime.now();

      model.onDateChanged(date);

      expect(model.selectedDate, date);
      expect(model.hasSelectedDate, isTrue);
    });

    test('save - completes sheet with confirmed true and selected date', () {
      final model = DatePickerSheetModel();
      final date = DateTime.now();
      model.onDateChanged(date);

      model.save();

      verify(mockBottomSheetService.completeSheet(
        SheetResponse(confirmed: true, data: date),
      )).called(1);
    });

    test('close - completes sheet with confirmed false', () {
      final model = DatePickerSheetModel();

      model.close();

      verify(mockBottomSheetService.completeSheet(
        SheetResponse(confirmed: false),
      )).called(1);
    });
  });
}
