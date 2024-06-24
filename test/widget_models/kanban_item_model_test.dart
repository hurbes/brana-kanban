import 'package:brana/app/app.bottomsheets.dart';
import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/widgets/common/kanban_item/kanban_item_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('KanbanItemModel -', () {
    late MockBottomSheetService mockBottomSheetService;

    setUp(() async {
      await registerServices();
      mockBottomSheetService = getAndRegisterBottomSheetService();
    });

    tearDown(() => locator.reset());

    test('doneTime returns formatted time when doneAt is not null', () {
      final model = KanbanItemModel();
      final task = Task(
        id: 1,
        boardId: 1,
        title: 'Test Task',
        description: 'Test Description',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        dueDate: DateTime.now(),
        status: TaskStatus.done,
        commentsCount: 0,
        enableReminder: true,
        prevTaskId: null,
        nextTaskId: null,
        inProgressAt: DateTime(2022, 1, 1, 10, 0, 0),
        doneAt: DateTime(2022, 1, 1, 12, 30, 45),
      );
      model.init(task);

      expect(model.doneTime, '2:30:45');
    });

    test('doneTime returns empty string when doneAt is null', () {
      final model = KanbanItemModel();
      final task = Task(
        id: 1,
        boardId: 1,
        title: 'Test Task',
        description: 'Test Description',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        dueDate: DateTime.now(),
        status: TaskStatus.inProgress,
        commentsCount: 0,
        enableReminder: true,
        prevTaskId: null,
        nextTaskId: null,
        inProgressAt: DateTime(2022, 1, 1, 10, 0, 0),
        doneAt: null,
      );
      model.init(task);

      expect(model.doneTime, '');
    });

    test('openDetails shows custom sheet with task data', () {
      final model = KanbanItemModel();
      final task = Task(
        id: 1,
        boardId: 1,
        title: 'Test Task',
        description: 'Test Description',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        dueDate: DateTime.now(),
        status: TaskStatus.inProgress,
        commentsCount: 0,
        enableReminder: true,
        prevTaskId: null,
        nextTaskId: null,
      );
      model.init(task);

      model.openDetails();

      verify(mockBottomSheetService.showCustomSheet(
        variant: BottomSheetType.addTask,
        data: task,
      )).called(1);
    });

    test('addComments shows custom sheet with task data', () {
      final model = KanbanItemModel();
      final task = Task(
        id: 1,
        boardId: 1,
        title: 'Test Task',
        description: 'Test Description',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        dueDate: DateTime.now(),
        status: TaskStatus.inProgress,
        commentsCount: 0,
        enableReminder: true,
        prevTaskId: null,
        nextTaskId: null,
      );
      model.init(task);

      model.addComments();

      verify(mockBottomSheetService.showCustomSheet(
        variant: BottomSheetType.addComment,
        data: task,
      )).called(1);
    });
  });
}
