import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/views/task_history/task_history_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('TaskHistoryViewModel -', () {
    late MockTaskService mockTaskService;
    late MockRouterService mockRouterService;
    late MockDateFormatter mockDateFormatter;

    setUp(() {
      registerServices();
      mockTaskService = getAndRegisterTaskService();
      mockRouterService = getAndRegisterRouterService();
      mockDateFormatter = getAndRegisterDateFormatter();
    });

    tearDown(() => locator.reset());

    test('futureToRun returns list of tasks', () async {
      final model = TaskHistoryViewModel(1);
      final tasks = [
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
        Task(
          id: 2,
          boardId: 1,
          title: 'Task 2',
          description: 'Description 2',
          status: TaskStatus.todo,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
        ),
      ];

      when(mockTaskService.getTasks(1)).thenAnswer((_) async => tasks);

      final result = await model.futureToRun();

      expect(result, [tasks[0]]); // Only the done task should be returned
      verify(mockTaskService.getTasks(1)).called(1);
    });

    test('getTime returns formatted time from dateFormatter', () {
      final model = TaskHistoryViewModel(1);
      final date = DateTime.now();

      when(mockDateFormatter.timeToReadable(date)).thenReturn('10:00 AM');

      final result = model.getTime(date);

      expect(result, '10:00 AM');
      verify(mockDateFormatter.timeToReadable(date)).called(1);
    });

    test('goBack calls router service', () {
      final model = TaskHistoryViewModel(1);

      model.goBack();

      verify(mockRouterService.back()).called(1);
    });

    test('onData removes non-done tasks', () {
      final model = TaskHistoryViewModel(1);
      final tasks = [
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
        Task(
          id: 2,
          boardId: 1,
          title: 'Task 2',
          description: 'Description 2',
          status: TaskStatus.todo,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
        ),
      ];

      model.onData(tasks);

      expect(model.data, [tasks[0]]);
    });
  });
}
