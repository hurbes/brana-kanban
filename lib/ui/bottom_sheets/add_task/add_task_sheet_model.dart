import 'package:brana/app/app.bottomsheets.dart';
import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/core/mixins/app_logger.dart';
import 'package:brana/core/services/notification_service.dart';
import 'package:brana/core/services/task_service.dart';
import 'package:brana/ui/bottom_sheets/add_task/add_task_sheet.form.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddTaskSheetModel extends FormViewModel with AppLogger {
  final _taskService = locator<TaskService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _notificationService = locator<NotificationService>();
  final _snackbarService = locator<SnackbarService>();

  DateTime? _dueDate;

  bool _enableReminder = false;

  bool get isDateSelected => _dueDate != null;
  bool get isReminderSelected => _enableReminder;

  bool get enableSubmit {
    return hasTitle && hasDescription;
  }

  TaskPriority _priority = TaskPriority.medium;

  TaskPriority get priority => _priority;

  void setPriority(TaskPriority priority) {
    _priority = priority;
    rebuildUi();
  }

  bool isSelected(TaskPriority priority) => _priority == priority;

  Future<void> scheduleReminderSheet() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.datePicker,
    );

    if (result?.confirmed == true) {
      log.v('Reminder Selected ${result?.data}');
      _dueDate = result!.data;
      rebuildUi();
    }
  }

  Future<void> addTask({required int lastIndex, required int boardId}) async {
    if (!enableSubmit) return;
    await runBusyFuture(
      _taskService.addTask(
        boardId: boardId,
        title: titleValue ?? '',
        description: descriptionValue ?? '',
        dueDate: _dueDate,
        prevIndex: lastIndex,
        priority: priority,
      ),
      busyObject: this,
    );
    _bottomSheetService.completeSheet(SheetResponse(confirmed: true));
  }

  void closeSheet() {
    _bottomSheetService.completeSheet(SheetResponse(confirmed: false));
  }

  Future<void> setReminder() async {
    if (_dueDate == null) {
      return _snackbarService.showSnackbar(
        title: 'No Date Selected',
        message: 'Please select a date first',
        duration: const Duration(seconds: 2),
      );
    }
    _enableReminder = !_enableReminder;
    rebuildUi();
  }

  @visibleForTesting
  Future<void> scheduleReminder(int id) async {
    if (_dueDate == null) return;

    return _notificationService.scheduleNotification(
      id: id,
      time: _dueDate!,
      title: titleValue ?? '',
      description: descriptionValue ?? '',
    );
  }
}
