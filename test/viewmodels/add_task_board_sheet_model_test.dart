import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/bottom_sheets/add_task_board/add_task_board_sheet_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('AddTaskBoardSheetModel -', () {
    late MockTaskService mockTaskService;
    late MockNotificationService mockNotificationService;
    late MockBottomSheetService mockBottomSheetService;
    late MockSnackbarService mockSnackbarService;

    setUp(() async {
      await registerServices();
      mockTaskService = getAndRegisterTaskService();
      mockNotificationService = getAndRegisterNotificationService();
      mockBottomSheetService = getAndRegisterBottomSheetService();
      mockSnackbarService = getAndRegisterSnackbarService();
    });

    tearDown(() => locator.reset());

    test('opeDatePicker sets due date and rebuilds UI', () async {
      final model = AddTaskBoardSheetModel(null);
      final dueDate = DateTime.now();

      when(mockBottomSheetService.showCustomSheet(
        variant: anyNamed('variant'),
      )).thenAnswer((_) async => SheetResponse(confirmed: true, data: dueDate));

      await model.opeDatePicker();

      expect(model.isDateSelected, isTrue);
    });

    test('setReminder shows snackbar if no date selected', () async {
      final model = AddTaskBoardSheetModel(null);

      await model.setReminder();

      verify(mockSnackbarService.showSnackbar(
        title: 'No Date Selected',
        message: 'Please select a date first',
        duration: const Duration(seconds: 2),
      )).called(1);
    });

    test('action calls addTaskBoard if TaskBoard is null', () async {
      final model = AddTaskBoardSheetModel(null);

      when(mockTaskService.addTaskBoard(
        dueDate: anyNamed('dueDate'),
        title: anyNamed('title'),
        desc: anyNamed('desc'),
        isReminder: anyNamed('isReminder'),
      )).thenAnswer((_) async => 1);

      await model.action();

      verify(mockTaskService.addTaskBoard(
        dueDate: anyNamed('dueDate'),
        title: anyNamed('title'),
        desc: anyNamed('desc'),
        isReminder: anyNamed('isReminder'),
      )).called(1);
    });

    test('action calls updateTaskBoard if TaskBoard is provided', () async {
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Board 1',
        description: 'Description 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        dueDate: DateTime.now(),
        isCompleted: false,
        isReminder: true,
      );
      final model = AddTaskBoardSheetModel(taskBoard);

      await model.action();

      verify(mockTaskService.updateTaskBoard(any)).called(1);
    });

    test('scheduleReminderSheet sets reminder time and rebuilds UI', () async {
      final model = AddTaskBoardSheetModel(null);
      const reminderTime = true;

      when(mockBottomSheetService.showCustomSheet(
        variant: anyNamed('variant'),
      )).thenAnswer(
          (_) async => SheetResponse(confirmed: true, data: reminderTime));

      await model.scheduleReminderSheet();

      expect(model.isReminderSelected, isTrue);
    });

    test('scheduleReminder schedules notification if due date is set',
        () async {
      final model = AddTaskBoardSheetModel(null);

      model.formValueMap['title'] = 'Test Title';
      model.formValueMap['description'] = 'Test Description';

      await model.scheduleReminder(1);

      verify(mockNotificationService.scheduleNotification(
        time: anyNamed('time'),
        id: 1,
        title: 'Test Title',
        description: 'Test Description',
      )).called(1);
    });

    test('addTaskBoard adds a task board and schedules a reminder', () async {
      final model = AddTaskBoardSheetModel(null);
      model.formValueMap['title'] = 'Test Title';
      model.formValueMap['description'] = 'Test Description';
      final dueDate = DateTime.now();

      when(mockTaskService.addTaskBoard(
        dueDate: anyNamed('dueDate'),
        title: anyNamed('title'),
        desc: anyNamed('desc'),
        isReminder: anyNamed('isReminder'),
      )).thenAnswer((_) async => 1);

      await model.addTaskBoard();

      verify(mockTaskService.addTaskBoard(
        dueDate: dueDate,
        title: 'Test Title',
        desc: 'Test Description',
        isReminder: true,
      )).called(1);
      verify(mockNotificationService.scheduleNotification(
        id: 1,
        time: dueDate,
        title: 'Test Title',
        description: 'Test Description',
      )).called(1);
    });

    test('updateTaskBoard updates a task board and schedules a reminder',
        () async {
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Board 1',
        description: 'Description 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        dueDate: DateTime.now(),
        isCompleted: false,
        isReminder: true,
      );
      final model = AddTaskBoardSheetModel(taskBoard);
      model.formValueMap['title'] = 'Updated Title';
      model.formValueMap['description'] = 'Updated Description';
      final dueDate = DateTime.now();

      await model.updateTaskBoard();

      verify(mockTaskService.updateTaskBoard(any)).called(1);
      verify(mockNotificationService.scheduleNotification(
        id: taskBoard.id,
        time: dueDate,
        title: 'Updated Title',
        description: 'Updated Description',
      )).called(1);
    });
  });
}
