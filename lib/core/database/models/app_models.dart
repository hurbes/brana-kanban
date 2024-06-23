// This file is "model.dart"
import 'package:dart_mappable/dart_mappable.dart';
import 'package:floor/floor.dart';

part 'app_models.mapper.dart';

@MappableEnum()
enum TaskStatus {
  todo,
  inProgress,
  done;

  String get name {
    switch (this) {
      case TaskStatus.todo:
        return 'To-do';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.done:
        return 'Done';
    }
  }

  int get color {
    switch (this) {
      case TaskStatus.todo:
        return 0xFFE57373;
      case TaskStatus.inProgress:
        return 0xFFFFA500;
      case TaskStatus.done:
        return 0xFF8BC48A;
    }
  }

  TaskStatus byName(String name) {
    switch (name) {
      case 'To-do':
        return TaskStatus.todo;
      case 'In Progress':
        return TaskStatus.inProgress;
      case 'Done':
        return TaskStatus.done;
      default:
        return TaskStatus.todo;
    }
  }
}

@MappableEnum()
enum TaskPriority {
  low,
  medium,
  high;

  String get name {
    switch (this) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
    }
  }

  int get color {
    switch (this) {
      case TaskPriority.low:
        return 0xFF8BC48A;
      case TaskPriority.medium:
        // yellow
        return 0xFFFFA500;
      case TaskPriority.high:
        return 0xFFE57373;
    }
  }

  String get icon {
    switch (this) {
      case TaskPriority.low:
        return '🟢';
      case TaskPriority.medium:
        return '🟡';
      case TaskPriority.high:
        return '🔴';
    }
  }

  TaskPriority byName(String name) {
    switch (name) {
      case 'Low':
        return TaskPriority.low;
      case 'Medium':
        return TaskPriority.medium;
      case 'High':
        return TaskPriority.high;
      default:
        return TaskPriority.medium;
    }
  }
}

@MappableClass()
@Entity(tableName: 'task_board_table')
class TaskBoard with TaskBoardMappable {
  const TaskBoard({
    required this.id,
    required this.title,
    required this.description,
    this.taskCount,
    required this.createdAt,
    required this.updatedAt,
    this.dueDate,
    this.isCompleted = false,
    this.isReminder = false,
  });

  @PrimaryKey(autoGenerate: true)
  final int id;
  final String title;
  final String description;
  final int? taskCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? dueDate;
  final bool isCompleted;
  final bool isReminder;
}

@MappableClass()
@Entity(
  tableName: 'task_table',
  primaryKeys: ['id'],
  foreignKeys: [
    ForeignKey(
      childColumns: ['boardId'],
      parentColumns: ['id'],
      entity: TaskBoard,
      onDelete: ForeignKeyAction.cascade,
      onUpdate: ForeignKeyAction.noAction,
    )
  ],
)
class Task with TaskMappable {
  const Task({
    required this.id,
    required this.boardId,
    required this.title,
    required this.description,
    this.priority = TaskPriority.medium,
    this.status = TaskStatus.todo,
    this.commentsCount = 0,
    this.enableReminder = true,
    this.prevTaskId,
    this.nextTaskId,
    required this.createdAt,
    required this.updatedAt,
    required this.dueDate,
    this.inProgressAt,
    this.doneAt,
  });

  @PrimaryKey(autoGenerate: true)
  final int id;
  final int boardId;
  final String title;
  final String description;
  final TaskPriority priority;
  final TaskStatus status;
  final int commentsCount;
  final bool enableReminder;
  final int? prevTaskId;
  final int? nextTaskId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? dueDate;
  final DateTime? inProgressAt;
  final DateTime? doneAt;
}

@MappableClass()
@Entity(tableName: 'task_comments_table', foreignKeys: [
  ForeignKey(
    childColumns: ['taskId'],
    parentColumns: ['id'],
    entity: Task,
    onDelete: ForeignKeyAction.cascade,
    onUpdate: ForeignKeyAction.noAction,
  ),
])
class TaskComment with TaskCommentMappable {
  const TaskComment({
    required this.id,
    required this.taskId,
    required this.comment,
    required this.createdAt,
  });

  @PrimaryKey(autoGenerate: true)
  final int id;
  final int taskId;
  final String comment;
  final DateTime? createdAt;
}
