import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/bottom_sheets/add_task/add_task_sheet_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('AddTaskSheetModel -', () {
    late MockTaskService mockTaskService;
    late MockBottomSheetService mockBottomSheetService;
    late MockNotificationService mockNotificationService;
    late MockSnackbarService mockSnackbarService;

    setUp(() async {
      await registerServices();
      mockTaskService = getAndRegisterTaskService();
      mockBottomSheetService = getAndRegisterBottomSheetService();
      mockNotificationService = getAndRegisterNotificationService();
      mockSnackbarService = getAndRegisterSnackbarService();
    });

    tearDown(() => locator.reset());

    test('setPriority - sets priority and rebuilds UI', () {
      final model = AddTaskSheetModel();
      model.setPriority(TaskPriority.high);

      expect(model.priority, TaskPriority.high);
    });

    test('addTask - success', () async {
      final model = AddTaskSheetModel();
      model.formValueMap['title'] = 'Test Title';
      model.formValueMap['description'] = 'Test Description';

      when(mockTaskService.addTask(
        boardId: anyNamed('boardId'),
        title: anyNamed('title'),
        description: anyNamed('description'),
        dueDate: anyNamed('dueDate'),
        prevIndex: anyNamed('prevIndex'),
        priority: anyNamed('priority'),
      )).thenAnswer((_) async => 1);

      await model.addTask(lastIndex: 0, boardId: 1);

      verify(mockTaskService.addTask(
        boardId: 1,
        title: 'Test Title',
        description: 'Test Description',
        dueDate: null,
        prevIndex: 0,
        priority: TaskPriority.medium,
      )).called(1);
    });

    test('addTask - fail if enableSubmit is false', () async {
      final model = AddTaskSheetModel();

      await model.addTask(lastIndex: 0, boardId: 1);

      verifyNever(mockTaskService.addTask(
        boardId: anyNamed('boardId'),
        title: anyNamed('title'),
        description: anyNamed('description'),
        dueDate: anyNamed('dueDate'),
        prevIndex: anyNamed('prevIndex'),
        priority: anyNamed('priority'),
      ));
    });

    test('scheduleReminderSheet - sets due date and rebuilds UI', () async {
      final model = AddTaskSheetModel();
      final dueDate = DateTime.now();

      when(mockBottomSheetService.showCustomSheet(
        variant: anyNamed('variant'),
      )).thenAnswer((_) async => SheetResponse(confirmed: true, data: dueDate));

      await model.scheduleReminderSheet();

      expect(model.isDateSelected, isTrue);
    });

    test('setReminder - shows snackbar if no date selected', () async {
      final model = AddTaskSheetModel();

      await model.setReminder();

      verify(mockSnackbarService.showSnackbar(
        title: 'No Date Selected',
        message: 'Please select a date first',
        duration: const Duration(seconds: 2),
      )).called(1);
    });

    test('scheduleReminder - schedules notification', () async {
      final model = AddTaskSheetModel();
      model.formValueMap['title'] = 'Test Title';
      model.formValueMap['description'] = 'Test Description';
      final dueDate = DateTime.now();

      await model.scheduleReminder(1);

      verify(mockNotificationService.scheduleNotification(
        id: 1,
        time: dueDate,
        title: 'Test Title',
        description: 'Test Description',
      )).called(1);
    });
  });
}
