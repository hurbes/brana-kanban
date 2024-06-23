import 'package:brana/app/app.bottomsheets.dart';
import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/core/mixins/app_logger.dart';
import 'package:brana/core/services/task_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class KanbanViewModel extends FutureViewModel<List<Task>> with AppLogger {
  final int boardId;
  KanbanViewModel({required this.boardId});

  final _routerService = locator<RouterService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final _taskService = locator<TaskService>();

  final _taskMap = <TaskStatus, List<Task>>{
    for (var status in TaskStatus.values) status: [],
  };

  Map<TaskStatus, List<Task>> get taskMap => _taskMap;

  void goBack() => _routerService.back();

  Future<void> isAllDone() async {
    final isTodoComplete = taskMap[TaskStatus.todo]!.isEmpty;
    final isInProgressComplete = taskMap[TaskStatus.inProgress]!.isEmpty;
    final isDoneComplete = taskMap[TaskStatus.done]!.isNotEmpty;

    if (isTodoComplete && isInProgressComplete && isDoneComplete) {
      final result = await _bottomSheetService.showBottomSheet(
        title: 'Congratulations!',
        description:
            'You have completed all tasks. Mark this board as Complete?',
        confirmButtonTitle: 'Mark as Complete',
        cancelButtonTitle: 'Cancel',
      );

      if (result?.confirmed == true) {
        await _taskService.completeTaskBoard(boardId);
        _bottomSheetService.showBottomSheet(
          title: 'Board Completed',
          description: 'This board has been marked as complete.',
          confirmButtonTitle: 'Great!',
        );
        goBack();
      }
    }
  }

  Future<void> openAddTaskBoardSheet() async {
    final lastIndex = (taskMap[TaskStatus.done]?.length ?? 0) - 1;

    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.addTask,
      data: {'lastIndex': lastIndex, 'boardId': boardId},
    );

    if (result?.confirmed == true) {
      initialise();
    }
  }

  @visibleForTesting
  void serializeTasks(List<Task> tasks) {
    _taskMap.clear();
    _taskMap.addAll({for (var status in TaskStatus.values) status: []});

    for (final status in TaskStatus.values) {
      final tasksForStatus =
          tasks.where((task) => task.status == status).toList();
      final taskById = {for (var task in tasksForStatus) task.id: task};

      Task? head = tasksForStatus.firstWhereOrNull(
        (task) => task.prevTaskId == null,
      );
      List<Task> orderedTasks = [];

      while (head != null) {
        orderedTasks.add(head);
        head = taskById[head.nextTaskId]; // Correctly move to the next task
      }

      if (orderedTasks.length != tasksForStatus.length) {
        // Identify and add tasks that were not included due to broken links
        Set<int> includedTaskIds = orderedTasks.map((t) => t.id).toSet();
        List<Task> missedTasks = tasksForStatus
            .where((t) => !includedTaskIds.contains(t.id))
            .toList();
        orderedTasks.addAll(missedTasks);
      }

      _taskMap[status] = orderedTasks;
    }
    isAllDone();
    rebuildUi();
  }

  void reOrderTask({
    required int statusIndex,
    required int oldStatusIndex,
    required int oldIndex,
    required int newIndex,
  }) async {
    if (oldIndex == newIndex && oldStatusIndex == statusIndex) return;
    // Check if the status change is occurring
    bool isStatusChanging = oldStatusIndex != statusIndex;

    // Remove the task from its old status list
    List<Task> oldTasksList = _taskMap[TaskStatus.values[oldStatusIndex]]!;
    Task movedTask = oldTasksList.removeAt(oldIndex);

    // Update task status if it's changing
    if (isStatusChanging) {
      if (TaskStatus.values[statusIndex] == TaskStatus.todo) {
        movedTask = movedTask.copyWith(
          status: TaskStatus.values[statusIndex],
          inProgressAt: null,
          doneAt: null,
        );
      } else if (TaskStatus.values[statusIndex] == TaskStatus.inProgress) {
        movedTask = movedTask.copyWith(
          status: TaskStatus.values[statusIndex],
          inProgressAt: DateTime.now(),
          doneAt: null,
        );
      } else if (TaskStatus.values[statusIndex] == TaskStatus.done) {
        movedTask = movedTask.copyWith(
          status: TaskStatus.values[statusIndex],
          doneAt: DateTime.now(),
        );
      }
    }

    // Insert the task into the new status list at the new index
    List<Task> newTasksList = _taskMap[TaskStatus.values[statusIndex]]!;
    if (newIndex > newTasksList.length) newIndex = newTasksList.length;
    newTasksList.insert(newIndex, movedTask);

    // Update the links in the old status list if status is not changing
    if (!isStatusChanging) {
      updateTaskLinks(oldTasksList);
    }

    // Always update the links in the new status list
    updateTaskLinks(newTasksList);

    // Perform all updates concurrently
    await Future.wait([
      ...updateTasksInService(oldTasksList),
      ...updateTasksInService(newTasksList),
    ]);
    await initialise(); // Refresh UI and reload data
  }

  @visibleForTesting
  void updateTaskLinks(List<Task> tasks) {
    for (int i = 0; i < tasks.length; i++) {
      Task task = tasks[i];
      int? prevTaskId = i > 0 ? tasks[i - 1].id : null;
      int? nextTaskId = i < tasks.length - 1 ? tasks[i + 1].id : null;

      // Only update if there's a change to prevent unnecessary service calls
      if (task.prevTaskId != prevTaskId || task.nextTaskId != nextTaskId) {
        tasks[i] = task.copyWith(
          prevTaskId: prevTaskId,
          nextTaskId: nextTaskId,
        );
      }
    }
  }

  @visibleForTesting
  List<Future<void>> updateTasksInService(List<Task> tasks) {
    return tasks.map((task) => _taskService.updateTask(task)).toList();
  }

  @override
  void onData(List<Task>? data) {
    log.v('Tasks: $data');
    if (data != null) serializeTasks(data);

    super.onData(data);
  }

  @override
  Future<List<Task>> futureToRun() => _taskService.getTasks(boardId);
}
