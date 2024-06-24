import 'package:brana/core/database/repository/task_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('TaskRepositoryTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    test('addTask - success', () async {
      final task = Task(
        id: 1,
        boardId: 1,
        title: 'Task 1',
        description: 'Description 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        dueDate: DateTime.now(),
      );

      final repository = TaskRepository();

      await repository.init();
      final database = getAndRegisterTaskDatabase();

      when(database.tasksDao.addTask(task)).thenAnswer((_) async => {});
      await repository.addTask(task);

      verify(database.tasksDao.addTask(task)).called(1);
    });

    test('addTaskBoard - success', () async {
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Board 1',
        description: 'Description 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final mockTaskBoardDao = getAndRegisterTaskBoardDao();
      final repository = await getAndRegisterTaskRepository();

      when(mockTaskBoardDao.addTaskBoard(taskBoard))
          .thenAnswer((_) async => {});

      await repository.addTaskBoard(taskBoard);

      verify(mockTaskBoardDao.addTaskBoard(taskBoard)).called(1);
    });

    test('updateTaskBoard - success', () async {
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Board 1',
        description: 'Updated Description',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final mockTaskBoardDao = getAndRegisterTaskBoardDao();
      final repository = await getAndRegisterTaskRepository();

      when(mockTaskBoardDao.updateTaskBoard(taskBoard))
          .thenAnswer((_) async => {});

      await repository.updateTaskBoard(taskBoard);

      verify(mockTaskBoardDao.updateTaskBoard(taskBoard)).called(1);
    });

    test('deleteTaskBoard - success', () async {
      final taskBoard = TaskBoard(
        id: 1,
        title: 'Board 1',
        description: 'Description 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final mockTaskBoardDao = getAndRegisterTaskBoardDao();
      final repository = await getAndRegisterTaskRepository();

      when(mockTaskBoardDao.deleteTaskBoard(taskBoard))
          .thenAnswer((_) async => {});

      await repository.deleteTaskBoard(taskBoard);

      verify(mockTaskBoardDao.deleteTaskBoard(taskBoard)).called(1);
    });

    test('getTaskBoards - success', () async {
      final taskBoards = [
        TaskBoard(
          id: 1,
          title: 'Board 1',
          description: 'Description 1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        )
      ];

      final mockTaskBoardDao = getAndRegisterTaskBoardDao();
      final repository = await getAndRegisterTaskRepository();

      when(mockTaskBoardDao.getTaskBoards())
          .thenAnswer((_) async => taskBoards);

      final result = await repository.getTaskBoards();

      expect(result, taskBoards);
      verify(mockTaskBoardDao.getTaskBoards()).called(1);
    });

    test('getTasks - success', () async {
      final tasks = [
        Task(
          id: 1,
          boardId: 1,
          title: 'Task 1',
          description: 'Description 1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          dueDate: DateTime.now(),
        )
      ];

      final mockTaskDao = getAndRegisterTasksDao();
      final repository = await getAndRegisterTaskRepository();

      when(mockTaskDao.getTasks(1)).thenAnswer((_) async => tasks);

      final result = await repository.getTasks(1);

      expect(result, tasks);
      verify(mockTaskDao.getTasks(1)).called(1);
    });

    test('addComment - success', () async {
      final comment = TaskComment(
        id: 1,
        taskId: 1,
        comment: 'Comment 1',
        createdAt: DateTime.now(),
      );

      final mockTaskCommentsDao = getAndRegisterTaskCommentsDao();
      final repository = await getAndRegisterTaskRepository();

      when(mockTaskCommentsDao.addComment(comment)).thenAnswer((_) async => {});

      await repository.addComment(comment);

      verify(mockTaskCommentsDao.addComment(comment)).called(1);
    });

    test('getComments - success', () async {
      final comments = [
        TaskComment(
          id: 1,
          taskId: 1,
          comment: 'Comment 1',
          createdAt: DateTime.now(),
        )
      ];

      final mockTaskCommentsDao = getAndRegisterTaskCommentsDao();
      final repository = await getAndRegisterTaskRepository();

      when(mockTaskCommentsDao.getComments(1))
          .thenAnswer((_) async => comments);

      final result = await repository.getComments(1);

      expect(result, comments);
      verify(mockTaskCommentsDao.getComments(1)).called(1);
    });

    test('deleteComment - success', () async {
      final comment = TaskComment(
        id: 1,
        taskId: 1,
        comment: 'Comment 1',
        createdAt: DateTime.now(),
      );

      final mockTaskCommentsDao = getAndRegisterTaskCommentsDao();
      final repository = await getAndRegisterTaskRepository();

      when(mockTaskCommentsDao.deleteComment(comment))
          .thenAnswer((_) async => {});

      await repository.deleteComment(comment);

      verify(mockTaskCommentsDao.deleteComment(comment)).called(1);
    });
  });
}
