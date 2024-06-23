import 'package:brana/core/database/models/app_models.dart';
import 'package:floor/floor.dart';

const queryInComplete = '''
SELECT tbt.*, COUNT(tt.boardId) as taskCount
FROM task_board_table tbt
LEFT JOIN task_table tt ON tbt.id = tt.boardId
WHERE tbt.isCompleted = 0
GROUP BY tbt.id
''';

const queryCompleted = '''
SELECT tbt.*, COUNT(tt.boardId) as taskCount
FROM task_board_table tbt
LEFT JOIN task_table tt ON tbt.id = tt.boardId
WHERE tbt.isCompleted = 1
GROUP BY tbt.id
''';

@dao
abstract class TaskBoardDao {
  @Query(queryInComplete)
  Future<List<TaskBoard>> getTaskBoards();

  @Query(queryCompleted)
  Future<List<TaskBoard>> getCompletedTaskBoards();

  @insert
  Future<void> addTaskBoard(TaskBoard taskBoard);

  @update
  Future<void> updateTaskBoard(TaskBoard taskBoard);

  @delete
  Future<void> deleteTaskBoard(TaskBoard taskBoard);

  @Query('UPDATE task_board_table SET isCompleted = 1 WHERE id = :id')
  Future<void> completeTaskBoard(int id);
}
