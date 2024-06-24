import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/views/kanban/kanban_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('KanbanViewModel -', () {
    late MockTaskService mockTaskService;
    late MockRouterService mockRouterService;
    late MockBottomSheetService mockBottomSheetService;

    setUp(() async {
      await registerServices();
      mockTaskService = getAndRegisterTaskService();
      mockRouterService = getAndRegisterRouterService();
      mockBottomSheetService = getAndRegisterBottomSheetService();
    });

    tearDown(() => locator.reset());

    test('futureToRun returns list of tasks', () async {
      final model = KanbanViewModel(boardId: 1);
      final tasks = [
        Task(
          id: 1,
          boardId: 1,
          title: 'Task 1',
          description: 'Description 1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
        ),
      ];

      when(mockTaskService.getTasks(1)).thenAnswer((_) async => tasks);

      final result = await model.futureToRun();

      expect(result, tasks);
      verify(mockTaskService.getTasks(1)).called(1);
    });

    test('goBack calls router service', () {
      final model = KanbanViewModel(boardId: 1);

      model.goBack();

      verify(mockRouterService.back()).called(1);
    });

    test(
        'openAddTaskBoardSheet shows custom sheet and reinitialises if confirmed',
        () async {
      final model = KanbanViewModel(boardId: 1);

      when(mockBottomSheetService.showCustomSheet(
        variant: anyNamed('variant'),
        data: anyNamed('data'),
      )).thenAnswer((_) async => SheetResponse(confirmed: true));

      await model.openAddTaskBoardSheet();

      verify(mockBottomSheetService.showCustomSheet(
        variant: anyNamed('variant'),
        data: anyNamed('data'),
      )).called(1);
      verify(mockTaskService.getTasks(1)).called(1);
    });

    test('serializeTasks correctly organizes tasks by status', () {
      final model = KanbanViewModel(boardId: 1);
      final tasks = [
        Task(
          id: 1,
          boardId: 1,
          title: 'Task 1',
          description: 'Description 1',
          status: TaskStatus.todo,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
        ),
        Task(
          id: 2,
          boardId: 1,
          title: 'Task 2',
          description: 'Description 2',
          status: TaskStatus.inProgress,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
        ),
        Task(
          id: 3,
          boardId: 1,
          title: 'Task 3',
          description: 'Description 3',
          status: TaskStatus.done,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
        ),
      ];

      model.serializeTasks(tasks);

      expect(model.taskMap[TaskStatus.todo], [tasks[0]]);
      expect(model.taskMap[TaskStatus.inProgress], [tasks[1]]);
      expect(model.taskMap[TaskStatus.done], [tasks[2]]);
    });

    test(
        'isAllDone shows bottom sheet and marks board as complete if all tasks are done',
        () async {
      final model = KanbanViewModel(boardId: 1);

      model.taskMap[TaskStatus.todo] = [];
      model.taskMap[TaskStatus.inProgress] = [];
      model.taskMap[TaskStatus.done] = [
        Task(
          id: 1,
          boardId: 1,
          title: 'Task 1',
          description: 'Description 1',
          status: TaskStatus.done,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
        ),
      ];

      when(mockBottomSheetService.showBottomSheet(
        title: anyNamed('title'),
        description: anyNamed('description'),
        confirmButtonTitle: anyNamed('confirmButtonTitle'),
        cancelButtonTitle: anyNamed('cancelButtonTitle'),
      )).thenAnswer((_) async => SheetResponse(confirmed: true));

      await model.isAllDone();

      verify(mockBottomSheetService.showBottomSheet(
        title: anyNamed('title'),
        description: anyNamed('description'),
        confirmButtonTitle: anyNamed('confirmButtonTitle'),
        cancelButtonTitle: anyNamed('cancelButtonTitle'),
      )).called(1);
      verify(mockTaskService.completeTaskBoard(1)).called(1);
    });

    test('reOrderTask updates task positions and status', () async {
      final model = KanbanViewModel(boardId: 1);
      final tasks = [
        Task(
          id: 1,
          boardId: 1,
          title: 'Task 1',
          description: 'Description 1',
          status: TaskStatus.todo,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
          prevTaskId: null,
          nextTaskId: 2,
        ),
        Task(
          id: 2,
          boardId: 1,
          title: 'Task 2',
          description: 'Description 2',
          status: TaskStatus.todo,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
          prevTaskId: 1,
          nextTaskId: 3,
        ),
        Task(
          id: 3,
          boardId: 1,
          title: 'Task 3',
          description: 'Description 3',
          status: TaskStatus.todo,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
          prevTaskId: 2,
          nextTaskId: null,
        ),
      ];

      model.serializeTasks(tasks);
      model.reOrderTask(
        statusIndex: 0,
        oldStatusIndex: 0,
        oldIndex: 2,
        newIndex: 0,
      );

      verify(mockTaskService.updateTask(any)).called(tasks.length);
      expect(
          model.taskMap[TaskStatus.todo]!.map((t) => t.id).toList(), [3, 1, 2]);
    });
  });
}
