import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/bottom_sheets/add_comment/add_comment_sheet_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AddCommentSheetModel -', () {
    final task = Task(
      id: 1,
      boardId: 1,
      title: 'Task 1',
      description: 'Description 1',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      dueDate: DateTime.now(),
    );

    setUp(() async => await registerServices());
    tearDown(() => locator.reset());

    test('initialise - success', () async {
      final model = AddCommentSheetModel(task);
      final comments = [
        TaskComment(
          id: 1,
          taskId: 1,
          comment: 'Test Comment',
          createdAt: DateTime.now(),
        ),
      ];

      final mockTaskService = getAndRegisterTaskService();

      when(mockTaskService.getComments(task.id))
          .thenAnswer((_) async => comments);

      await model.initialise();

      expect(model.data, comments);
      verify(mockTaskService.getComments(task.id)).called(1);
    });

    test('addComment - success', () async {
      final mockTaskService = getAndRegisterTaskService();

      final model = AddCommentSheetModel(task);
      const commentText = 'New Comment';
      model.formValueMap['comment'] = commentText;

      when(mockTaskService.addComment(any)).thenAnswer((_) async => {});

      await model.addComment();

      verify(mockTaskService.addComment(any)).called(1);
      expect(model.enableSubmit, isTrue);
    });

    test('addComment - empty comment', () async {
      final model = AddCommentSheetModel(task);
      final mockTaskService = getAndRegisterTaskService();
      await model.addComment();

      verifyNever(mockTaskService.addComment(any));
      expect(model.enableSubmit, isFalse);
    });

    test('getCommentDate - success', () async {
      final model = AddCommentSheetModel(task);
      final date = DateTime.now();

      final mockDateFormatter = getAndRegisterDateFormatter();

      when(mockDateFormatter.dateToReadable(date)).thenReturn('Readable Date');

      final result = model.getCommentDate(date);

      expect(result, 'Readable Date');
      verify(mockDateFormatter.dateToReadable(date)).called(1);
    });
  });
}
