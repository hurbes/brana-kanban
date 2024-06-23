import 'package:brana/core/database/models/app_models.dart';

import 'package:floor/floor.dart';

const _query = '''
SELECT tt.*, COUNT(tct.taskId) AS commentsCount
FROM task_table tt
LEFT JOIN task_comments_table tct ON tt.id = tct.taskId AND tt.boardId = :boardId
GROUP BY tt.id;
''';

@dao
abstract class TasksDao {
  @Query(_query)
  Future<List<Task>> getTasks(int boardId);

  @insert
  Future<void> addTask(Task task);

  @update
  Future<void> updateTask(Task task);

  @delete
  Future<void> deleteTask(Task task);
}
