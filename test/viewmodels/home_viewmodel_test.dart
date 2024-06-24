import 'package:brana/app/app.locator.dart';
import 'package:brana/app/app.router.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/views/home/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('HomeViewModel -', () {
    late MockTaskService mockTaskService;
    late MockNotificationService mockNotificationService;
    late MockBottomSheetService mockBottomSheetService;
    late MockRouterService mockRouterService;

    setUp(() async {
      await registerServices();
      mockTaskService = getAndRegisterTaskService();
      mockNotificationService = getAndRegisterNotificationService();
      mockBottomSheetService = getAndRegisterBottomSheetService();
      mockRouterService = getAndRegisterRouterService();
    });

    tearDown(() => locator.reset());

    test('futureToRun returns list of task boards', () async {
      final model = HomeViewModel();
      final taskBoards = [
        TaskBoard(
          id: 1,
          title: 'Task Board 1',
          description: 'Description 1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
          isCompleted: false,
          isReminder: false,
        )
      ];

      when(mockTaskService.getTaskBoards()).thenAnswer((_) async => taskBoards);

      final result = await model.futureToRun();

      expect(result, taskBoards);
      verify(mockTaskService.getTaskBoards()).called(1);
    });

    test('navigateToSettings calls router service', () {
      final model = HomeViewModel();

      model.navigateToSettings();

      verify(mockRouterService.navigateToSettingsView()).called(1);
    });

    test('navigateToTaskBoard calls router service and reinitialises',
        () async {
      final model = HomeViewModel();
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Task Board 1',
        description: 'Description 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        dueDate: DateTime.now(),
        isCompleted: false,
        isReminder: false,
      );

      await model.navigateToTaskBoard(taskBoard);

      verify(mockRouterService.navigateToKanbanView(
        id: taskBoard.id,
        title: taskBoard.title,
      )).called(1);
      verify(mockTaskService.getTaskBoards()).called(1);
    });

    test('addTaskBoard shows bottom sheet and reinitialises if confirmed',
        () async {
      final model = HomeViewModel();

      when(mockBottomSheetService.showCustomSheet(
        variant: anyNamed('variant'),
      )).thenAnswer((_) async => SheetResponse(confirmed: true));

      await model.addTaskBoard();

      verify(mockBottomSheetService.showCustomSheet(
        variant: anyNamed('variant'),
      )).called(1);
      verify(mockTaskService.getTaskBoards()).called(1);
    });

    test(
        'longPressTaskBoard shows bottom sheet and calls edit or delete based on response',
        () async {
      final model = HomeViewModel();
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Task Board 1',
        description: 'Description 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        dueDate: DateTime.now(),
        isCompleted: false,
        isReminder: false,
      );

      // Test edit
      when(mockBottomSheetService.showBottomSheet(
        title: anyNamed('title'),
        description: anyNamed('description'),
        confirmButtonTitle: anyNamed('confirmButtonTitle'),
        cancelButtonTitle: anyNamed('cancelButtonTitle'),
      )).thenAnswer((_) async => SheetResponse(confirmed: true));

      await model.longPressTaskBoard(taskBoard);

      verify(mockBottomSheetService.showBottomSheet(
        title: anyNamed('title'),
        description: anyNamed('description'),
        confirmButtonTitle: anyNamed('confirmButtonTitle'),
        cancelButtonTitle: anyNamed('cancelButtonTitle'),
      )).called(1);
      verify(mockBottomSheetService.showCustomSheet(
        data: taskBoard,
        variant: anyNamed('variant'),
      )).called(1);

      // Test delete
      when(mockBottomSheetService.showBottomSheet(
        title: anyNamed('title'),
        description: anyNamed('description'),
        confirmButtonTitle: anyNamed('confirmButtonTitle'),
        cancelButtonTitle: anyNamed('cancelButtonTitle'),
      )).thenAnswer((_) async => SheetResponse(confirmed: false));

      await model.longPressTaskBoard(taskBoard);

      verify(mockBottomSheetService.showBottomSheet(
        title: anyNamed('title'),
        description: anyNamed('description'),
        confirmButtonTitle: anyNamed('confirmButtonTitle'),
        cancelButtonTitle: anyNamed('cancelButtonTitle'),
      )).called(
          2); // called twice because we test both edit and delete scenarios
    });

    test('editTaskBoard shows bottom sheet and reinitialises if confirmed',
        () async {
      final model = HomeViewModel();
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Task Board 1',
        description: 'Description 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        dueDate: DateTime.now(),
        isCompleted: false,
        isReminder: false,
      );

      when(mockBottomSheetService.showCustomSheet(
        data: anyNamed('data'),
        variant: anyNamed('variant'),
      )).thenAnswer((_) async => SheetResponse(confirmed: true));

      await model.editTaskBoard(taskBoard);

      verify(mockBottomSheetService.showCustomSheet(
        data: taskBoard,
        variant: anyNamed('variant'),
      )).called(1);
      verify(mockTaskService.getTaskBoards()).called(1);
    });

    test(
        'deleteTaskBoard shows confirmation bottom sheet, deletes task board, cancels notification, and reinitialises if confirmed',
        () async {
      final model = HomeViewModel();
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Task Board 1',
        description: 'Description 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        dueDate: DateTime.now(),
        isCompleted: false,
        isReminder: false,
      );

      when(mockBottomSheetService.showBottomSheet(
        title: anyNamed('title'),
        description: anyNamed('description'),
        confirmButtonTitle: anyNamed('confirmButtonTitle'),
        cancelButtonTitle: anyNamed('cancelButtonTitle'),
      )).thenAnswer((_) async => SheetResponse(confirmed: true));

      await model.deleteTaskBoard(taskBoard);

      verify(mockBottomSheetService.showBottomSheet(
        title: anyNamed('title'),
        description: anyNamed('description'),
        confirmButtonTitle: anyNamed('confirmButtonTitle'),
        cancelButtonTitle: anyNamed('cancelButtonTitle'),
      )).called(1);
      verify(mockTaskService.deleteTaskBoard(taskBoard)).called(1);
      verify(mockNotificationService.cancelNotification(taskBoard.id))
          .called(1);
      verify(mockTaskService.getTaskBoards()).called(1);
    });

    test('initialise initializes notification service and fetches task boards',
        () async {
      final model = HomeViewModel();

      await model.initialise();

      verify(mockNotificationService.initialize()).called(1);
      verify(mockTaskService.getTaskBoards()).called(1);
    });
  });
}
