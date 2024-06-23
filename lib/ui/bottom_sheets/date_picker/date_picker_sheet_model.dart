import 'package:brana/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DatePickerSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  bool get hasSelectedDate => _selectedDate != null;

  void onDateChanged(DateTime date) {
    _selectedDate = date;
    rebuildUi();
  }

  void save() {
    _bottomSheetService.completeSheet(
      SheetResponse(confirmed: true, data: _selectedDate),
    );
  }

  void close() {
    _bottomSheetService.completeSheet(SheetResponse(confirmed: false));
  }
}
