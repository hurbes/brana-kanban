import 'package:brana/core/database/db/app_database.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/core/mixins/app_logger.dart';

class TaskRepository with AppLogger {
  late final TaskDatabase _db;

  Future<void> init() async {
    _db = await $FloorTaskDatabase.databaseBuilder('task_database.db').build();
  }

  Future<void> addTask(Task task) async {
    try {
      await _db.tasksDao.addTask(task);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addTaskBoard(TaskBoard taskBoard) async {
    try {
      return _db.taskBoardDao.addTaskBoard(taskBoard);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateTaskBoard(TaskBoard taskBoard) async {
    try {
      return _db.taskBoardDao.updateTaskBoard(taskBoard);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteTaskBoard(TaskBoard taskBoard) async {
    try {
      return _db.taskBoardDao.deleteTaskBoard(taskBoard);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      return _db.tasksDao.deleteTask(task);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<TaskBoard>> getTaskBoards() async {
    try {
      return await _db.taskBoardDao.getTaskBoards();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Task>> getTasks(int boardId) async {
    try {
      return _db.tasksDao.getTasks(boardId);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      return _db.tasksDao.updateTask(task);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> completeTaskBoard(int id) async {
    try {
      return _db.taskBoardDao.completeTaskBoard(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<TaskComment>> getComments(int taskId) async {
    try {
      return _db.taskCommentsDao.getComments(taskId);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addComment(TaskComment comment) async {
    try {
      log.v('');
      return await _db.taskCommentsDao.addComment(comment);
    } catch (e) {
      log.e(e);
      throw Exception(e);
    }
  }

  Future<void> updateComment(TaskComment comment) async {
    try {
      return _db.taskCommentsDao.updateComment(comment);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteComment(TaskComment comment) async {
    try {
      return _db.taskCommentsDao.deleteComment(comment);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<TaskBoard>> getCompletedTaskBoard() async {
    try {
      return _db.taskBoardDao.getCompletedTaskBoards();
    } catch (e) {
      throw Exception(e);
    }
  }
}
