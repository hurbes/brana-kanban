import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/widgets/common/task_board_item/task_board_item_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('TaskBoardItemModel -', () {
    late MockDateFormatter mockDateFormatter;

    setUp(() async {
      await registerServices();
      mockDateFormatter = getAndRegisterDateFormatter();
    });

    tearDown(() => locator.reset());

    test('getCreateAtDate returns formatted date from dateFormatter', () {
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Board 1',
        description: 'Description 1',
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 2),
        dueDate: DateTime(2022, 1, 3),
        isCompleted: false,
        isReminder: false,
      );

      when(mockDateFormatter.dateToReadable(any)).thenReturn('Jan 1, 2022');

      final model = TaskBoardItemModel(taskBoard);

      expect(model.getCreateAtDate, 'Jan 1, 2022');
      verify(mockDateFormatter.dateToReadable(taskBoard.createdAt!)).called(1);
    });

    test('getCreateAtDate returns empty string if createdAt is null', () {
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Board 1',
        description: 'Description 1',
        createdAt: null,
        updatedAt: DateTime(2022, 1, 2),
        dueDate: DateTime(2022, 1, 3),
        isCompleted: false,
        isReminder: false,
      );

      final model = TaskBoardItemModel(taskBoard);

      expect(model.getCreateAtDate, '');
      verifyNever(mockDateFormatter.dateToReadable(any));
    });

    test('getDueTime returns formatted time from dateFormatter', () {
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Board 1',
        description: 'Description 1',
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 2),
        dueDate: DateTime(2022, 1, 3, 10, 30),
        isCompleted: false,
        isReminder: false,
      );

      when(mockDateFormatter.timeToReadable(any)).thenReturn('10:30 AM');

      final model = TaskBoardItemModel(taskBoard);

      expect(model.getDueTime, '10:30 AM');
      verify(mockDateFormatter.timeToReadable(taskBoard.dueDate!)).called(1);
    });

    test('getDueTime returns empty string if dueDate is null', () {
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Board 1',
        description: 'Description 1',
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 2),
        dueDate: null,
        isCompleted: false,
        isReminder: false,
      );

      final model = TaskBoardItemModel(taskBoard);

      expect(model.getDueTime, '');
      verifyNever(mockDateFormatter.timeToReadable(any));
    });
  });
}
