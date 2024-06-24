import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/views/history/history_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('HistoryViewModel -', () {
    late MockTaskService mockTaskService;

    setUp(() async {
      await registerServices();
      mockTaskService = getAndRegisterTaskService();
    });

    tearDown(() => locator.reset());

    test('futureToRun returns list of completed task boards', () async {
      final model = HistoryViewModel();
      final taskBoards = [
        TaskBoard(
          id: 1,
          title: 'Completed Board',
          description: 'Description 1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
          isCompleted: true,
          isReminder: false,
        )
      ];

      when(mockTaskService.getCompletedTaskBoard())
          .thenAnswer((_) async => taskBoards);

      final result = await model.futureToRun();

      expect(result, taskBoards);
      verify(mockTaskService.getCompletedTaskBoard()).called(1);
    });
  });
}
