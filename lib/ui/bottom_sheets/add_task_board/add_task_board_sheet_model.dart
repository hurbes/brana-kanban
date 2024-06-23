import 'package:brana/app/app.bottomsheets.dart';
import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/core/mixins/app_logger.dart';
import 'package:brana/core/services/notification_service.dart';
import 'package:brana/core/services/task_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'add_task_board_sheet.form.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class AddTaskBoardSheetModel extends FormViewModel with AppLogger {
  final _taskService = locator<TaskService>();
  final _notificationService = locator<NotificationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _snackbarService = locator<SnackbarService>();

  final TaskBoard? _board;
  DateTime? _dueDate;

  bool _reminderTime = false;

  bool get isDateSelected => _dueDate != null;
  bool get isReminderSelected => _reminderTime;

  AddTaskBoardSheetModel(this._board) {
    if (_board != null) {
      titleValue = _board!.title;
      descriptionValue = _board!.description;
      _dueDate = _board!.dueDate;
      _reminderTime = _board!.isReminder;
    }
  }

  String get buttonTile => _board != null ? 'Edit Board' : 'Add Board';
  bool get isEdit => _board != null;

  bool get enableSubmit {
    final validTitle = titleValue != null && titleValue!.isNotEmpty;
    final validDescription =
        descriptionValue != null && descriptionValue!.isNotEmpty;

    return validTitle && validDescription;
  }

  Future<void> opeDatePicker() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.datePicker,
    );

    if (result?.confirmed == true) {
      log.v('Date Selected ${result?.data}');
      _dueDate = result!.data;
      rebuildUi();
    }
  }

  Future<void> setReminder() async {
    if (_dueDate == null) {
      return _snackbarService.showSnackbar(
        title: 'No Date Selected',
        message: 'Please select a date first',
        duration: const Duration(seconds: 2),
      );
    }
    _reminderTime = !_reminderTime;
    rebuildUi();
  }

  Future<void> action() async {
    if (_board == null) return addTaskBoard();
    return updateTaskBoard();
  }

  Future<void> scheduleReminderSheet() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.datePicker,
    );

    if (result?.confirmed == true) {
      log.v('Reminder Selected ${result?.data}');
      _reminderTime = result!.data;
      rebuildUi();
    }
  }

  @visibleForTesting
  Future<void> scheduleReminder(int id) async {
    if (_dueDate == null) return;

    if (!_reminderTime && _board != null) {
      return _notificationService.cancelNotification(id);
    }

    return _notificationService.scheduleNotification(
      id: id,
      time: _dueDate!,
      title: titleValue ?? '',
      description: descriptionValue ?? '',
    );
  }

  @visibleForTesting
  Future<void> addTaskBoard() async {
    final id = await runBusyFuture(
      _taskService.addTaskBoard(
        dueDate: _dueDate,
        title: titleValue ?? '',
        desc: descriptionValue ?? '',
        isReminder: _reminderTime,
      ),
      busyObject: true,
    );
    await scheduleReminder(id);
    _bottomSheetService.completeSheet(SheetResponse(confirmed: true));
  }

  @visibleForTesting
  Future<void> updateTaskBoard() async {
    final updatedBoard = _board!.copyWith(
      title: titleValue ?? '',
      description: descriptionValue ?? '',
      dueDate: _dueDate,
      isReminder: _reminderTime,
    );
    await runBusyFuture(
      _taskService.updateTaskBoard(updatedBoard),
      busyObject: true,
    );
    await scheduleReminder(updatedBoard.id);
    _bottomSheetService.completeSheet(SheetResponse(confirmed: true));
  }
}
