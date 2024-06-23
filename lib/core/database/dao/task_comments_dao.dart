import 'package:brana/core/database/models/app_models.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskCommentsDao {
  @Query('SELECT * FROM task_comments_table WHERE taskId = :taskId')
  Future<List<TaskComment>> getComments(int taskId);

  @insert
  Future<void> addComment(TaskComment comment);

  @update
  Future<void> updateComment(TaskComment comment);

  @delete
  Future<void> deleteComment(TaskComment comment);
}
