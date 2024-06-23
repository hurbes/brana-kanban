import 'package:brana/app/app.bottomsheets.dart';
import 'package:brana/app/app.locator.dart';
import 'package:brana/app/app.router.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/core/mixins/app_logger.dart';
import 'package:brana/core/services/notification_service.dart';
import 'package:brana/core/services/task_service.dart';
import 'package:flutter/foundation.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<List<TaskBoard>> with AppLogger {
  final _routerService = locator<RouterService>();

  final _notificationService = locator<NotificationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final _taskService = locator<TaskService>();

  int get taskBoardCount => data?.length ?? 0;

  void navigateToSettings() {
    _routerService.navigateToSettingsView();
  }

  Future<void> navigateToTaskBoard(TaskBoard taskBoard) async {
    await _routerService.navigateToKanbanView(
      id: taskBoard.id,
      title: taskBoard.title,
    );
    await initialise();
  }

  Future<void> addTaskBoard() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.addTaskBoard,
    );

    if (result?.confirmed == true) {
      initialise();
    }
  }

  Future<void> longPressTaskBoard(TaskBoard taskBoard) async {
    final result = await _bottomSheetService.showBottomSheet(
      title: 'Edit Board',
      description: 'What would you like to do?',
      confirmButtonTitle: 'Edit',
      cancelButtonTitle: 'Delete',
    );
    if (result == null) return;

    if (result.confirmed == true) {
      return editTaskBoard(taskBoard);
    }
    return deleteTaskBoard(taskBoard);
  }

  @visibleForTesting
  Future<void> editTaskBoard(TaskBoard task) async {
    final result = await _bottomSheetService.showCustomSheet(
      data: task,
      variant: BottomSheetType.addTaskBoard,
    );

    if (result?.confirmed == true) {
      initialise();
    }
  }

  @visibleForTesting
  Future<void> deleteTaskBoard(TaskBoard taskBoard) async {
    final result = await _bottomSheetService.showBottomSheet(
      title: 'Delete!',
      description: 'Are you sure you want to delete this board?',
      confirmButtonTitle: 'Delete',
      cancelButtonTitle: 'Cancel',
    );

    if (result == null) result;

    if (result!.confirmed) {
      await _taskService.deleteTaskBoard(taskBoard);
      await _notificationService.cancelNotification(taskBoard.id);
      initialise();
    }
  }

  @override
  void onData(List<TaskBoard>? data) {
    log.v('Task Boards: $data');
    super.onData(data);
  }

  @override
  Future<Future> initialise() async {
    _notificationService.initialize();
    return super.initialise();
  }

  @override
  Future<List<TaskBoard>> futureToRun() => _taskService.getTaskBoards();
}
