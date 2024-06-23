import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/core/database/repository/task_repository.dart';
import 'package:brana/core/mixins/app_logger.dart';
import 'package:brana/core/utils/utils.dart';

class TaskService with AppLogger {
  final _repository = locator<TaskRepository>();

  Future<int> addTaskBoard({
    required String title,
    required String desc,
    required DateTime? dueDate,
    required bool isReminder,
  }) async {
    final id = adjustTo32BitInt(DateTime.now().microsecondsSinceEpoch);
    final taskBoard = TaskBoard(
      id: id,
      title: title,
      description: desc,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      dueDate: dueDate,
      isReminder: isReminder,
    );
    await _repository.addTaskBoard(taskBoard);
    return id;
  }

  Future<List<TaskBoard>> getTaskBoards() {
    return _repository.getTaskBoards();
  }

  Future<List<Task>> getTasks(int boardId) {
    return _repository.getTasks(boardId);
  }

  Future<void> addTask({
    required int boardId,
    required String title,
    required String description,
    required int prevIndex,
    required TaskPriority priority,
  }) async {
    final task = Task(
      id: DateTime.now().microsecondsSinceEpoch,
      boardId: boardId,
      title: title,
      description: description,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      dueDate: DateTime.now(),
      prevTaskId: prevIndex,
      priority: priority,
      status: TaskStatus.todo,
    );
    await _repository.addTask(task);
  }

  Future<void> updateTaskBoard(TaskBoard board) async {
    await _repository.updateTaskBoard(board);
  }

  Future<void> deleteTaskBoard(TaskBoard task) async {
    await _repository.deleteTaskBoard(task);
  }

  Future<void> updateTask(Task task) async {
    await _repository.updateTask(task);
  }

  Future<void> deleteTask(Task task) async {
    await _repository.deleteTask(task);
  }

  Future<void> completeTaskBoard(int id) async {
    await _repository.completeTaskBoard(id);
  }

  Future<void> addComment(TaskComment comment) async {
    await _repository.addComment(comment);
  }

  Future<void> updateComment(TaskComment comment) async {
    await _repository.updateComment(comment);
  }

  Future<List<TaskComment>> getComments(int taskId) {
    log.v('getComments $taskId');
    return _repository.getComments(taskId);
  }

  Future<void> deleteComment(TaskComment comment) async {
    await _repository.deleteComment(comment);
  }

  Future<List<TaskBoard>> getCompletedTaskBoard() async {
    return _repository.getCompletedTaskBoard();
  }
}
