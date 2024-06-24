// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $TaskDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $TaskDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $TaskDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<TaskDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorTaskDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $TaskDatabaseBuilderContract databaseBuilder(String name) =>
      _$TaskDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $TaskDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$TaskDatabaseBuilder(null);
}

class _$TaskDatabaseBuilder implements $TaskDatabaseBuilderContract {
  _$TaskDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $TaskDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $TaskDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<TaskDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$TaskDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TaskDatabase extends TaskDatabase {
  _$TaskDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskBoardDao? _taskBoardDaoInstance;

  TasksDao? _tasksDaoInstance;

  TaskCommentsDao? _taskCommentsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_table` (`id` INTEGER NOT NULL, `boardId` INTEGER NOT NULL, `title` TEXT NOT NULL, `description` TEXT NOT NULL, `priority` INTEGER NOT NULL, `status` INTEGER NOT NULL, `commentsCount` INTEGER NOT NULL, `enableReminder` INTEGER NOT NULL, `prevTaskId` INTEGER, `nextTaskId` INTEGER, `createdAt` INTEGER, `updatedAt` INTEGER, `dueDate` INTEGER, `inProgressAt` INTEGER, `doneAt` INTEGER, FOREIGN KEY (`boardId`) REFERENCES `task_board_table` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_board_table` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `title` TEXT NOT NULL, `description` TEXT NOT NULL, `taskCount` INTEGER, `createdAt` INTEGER, `updatedAt` INTEGER, `dueDate` INTEGER, `isCompleted` INTEGER NOT NULL, `isReminder` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task_comments_table` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `taskId` INTEGER NOT NULL, `comment` TEXT NOT NULL, `createdAt` INTEGER, FOREIGN KEY (`taskId`) REFERENCES `task_table` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskBoardDao get taskBoardDao {
    return _taskBoardDaoInstance ??= _$TaskBoardDao(database, changeListener);
  }

  @override
  TasksDao get tasksDao {
    return _tasksDaoInstance ??= _$TasksDao(database, changeListener);
  }

  @override
  TaskCommentsDao get taskCommentsDao {
    return _taskCommentsDaoInstance ??=
        _$TaskCommentsDao(database, changeListener);
  }
}

class _$TaskBoardDao extends TaskBoardDao {
  _$TaskBoardDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskBoardInsertionAdapter = InsertionAdapter(
            database,
            'task_board_table',
            (TaskBoard item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'taskCount': item.taskCount,
                  'createdAt': _dateTimeConverter.encode(item.createdAt),
                  'updatedAt': _dateTimeConverter.encode(item.updatedAt),
                  'dueDate': _dateTimeConverter.encode(item.dueDate),
                  'isCompleted': item.isCompleted ? 1 : 0,
                  'isReminder': item.isReminder ? 1 : 0
                }),
        _taskBoardUpdateAdapter = UpdateAdapter(
            database,
            'task_board_table',
            ['id'],
            (TaskBoard item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'taskCount': item.taskCount,
                  'createdAt': _dateTimeConverter.encode(item.createdAt),
                  'updatedAt': _dateTimeConverter.encode(item.updatedAt),
                  'dueDate': _dateTimeConverter.encode(item.dueDate),
                  'isCompleted': item.isCompleted ? 1 : 0,
                  'isReminder': item.isReminder ? 1 : 0
                }),
        _taskBoardDeletionAdapter = DeletionAdapter(
            database,
            'task_board_table',
            ['id'],
            (TaskBoard item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'taskCount': item.taskCount,
                  'createdAt': _dateTimeConverter.encode(item.createdAt),
                  'updatedAt': _dateTimeConverter.encode(item.updatedAt),
                  'dueDate': _dateTimeConverter.encode(item.dueDate),
                  'isCompleted': item.isCompleted ? 1 : 0,
                  'isReminder': item.isReminder ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskBoard> _taskBoardInsertionAdapter;

  final UpdateAdapter<TaskBoard> _taskBoardUpdateAdapter;

  final DeletionAdapter<TaskBoard> _taskBoardDeletionAdapter;

  @override
  Future<List<TaskBoard>> getTaskBoards() async {
    return _queryAdapter.queryList(
        'SELECT tbt.*, COUNT(tt.boardId) as taskCount FROM task_board_table tbt LEFT JOIN task_table tt ON tbt.id = tt.boardId WHERE tbt.isCompleted = 0 GROUP BY tbt.id',
        mapper: (Map<String, Object?> row) => TaskBoard(
            id: row['id'] as int,
            title: row['title'] as String,
            description: row['description'] as String,
            taskCount: row['taskCount'] as int?,
            createdAt: _dateTimeConverter.decode(row['createdAt'] as int?),
            updatedAt: _dateTimeConverter.decode(row['updatedAt'] as int?),
            dueDate: _dateTimeConverter.decode(row['dueDate'] as int?),
            isCompleted: (row['isCompleted'] as int) != 0,
            isReminder: (row['isReminder'] as int) != 0));
  }

  @override
  Future<List<TaskBoard>> getCompletedTaskBoards() async {
    return _queryAdapter.queryList(
        'SELECT tbt.*, COUNT(tt.boardId) as taskCount FROM task_board_table tbt LEFT JOIN task_table tt ON tbt.id = tt.boardId WHERE tbt.isCompleted = 1 GROUP BY tbt.id',
        mapper: (Map<String, Object?> row) => TaskBoard(
            id: row['id'] as int,
            title: row['title'] as String,
            description: row['description'] as String,
            taskCount: row['taskCount'] as int?,
            createdAt: _dateTimeConverter.decode(row['createdAt'] as int?),
            updatedAt: _dateTimeConverter.decode(row['updatedAt'] as int?),
            dueDate: _dateTimeConverter.decode(row['dueDate'] as int?),
            isCompleted: (row['isCompleted'] as int) != 0,
            isReminder: (row['isReminder'] as int) != 0));
  }

  @override
  Future<void> completeTaskBoard(int id) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE task_board_table SET isCompleted = 1 WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> addTaskBoard(TaskBoard taskBoard) async {
    await _taskBoardInsertionAdapter.insert(
        taskBoard, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTaskBoard(TaskBoard taskBoard) async {
    await _taskBoardUpdateAdapter.update(taskBoard, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTaskBoard(TaskBoard taskBoard) async {
    await _taskBoardDeletionAdapter.delete(taskBoard);
  }
}

class _$TasksDao extends TasksDao {
  _$TasksDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'task_table',
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'boardId': item.boardId,
                  'title': item.title,
                  'description': item.description,
                  'priority': item.priority.index,
                  'status': item.status.index,
                  'commentsCount': item.commentsCount,
                  'enableReminder': item.enableReminder ? 1 : 0,
                  'prevTaskId': item.prevTaskId,
                  'nextTaskId': item.nextTaskId,
                  'createdAt': _dateTimeConverter.encode(item.createdAt),
                  'updatedAt': _dateTimeConverter.encode(item.updatedAt),
                  'dueDate': _dateTimeConverter.encode(item.dueDate),
                  'inProgressAt': _dateTimeConverter.encode(item.inProgressAt),
                  'doneAt': _dateTimeConverter.encode(item.doneAt)
                }),
        _taskUpdateAdapter = UpdateAdapter(
            database,
            'task_table',
            ['id'],
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'boardId': item.boardId,
                  'title': item.title,
                  'description': item.description,
                  'priority': item.priority.index,
                  'status': item.status.index,
                  'commentsCount': item.commentsCount,
                  'enableReminder': item.enableReminder ? 1 : 0,
                  'prevTaskId': item.prevTaskId,
                  'nextTaskId': item.nextTaskId,
                  'createdAt': _dateTimeConverter.encode(item.createdAt),
                  'updatedAt': _dateTimeConverter.encode(item.updatedAt),
                  'dueDate': _dateTimeConverter.encode(item.dueDate),
                  'inProgressAt': _dateTimeConverter.encode(item.inProgressAt),
                  'doneAt': _dateTimeConverter.encode(item.doneAt)
                }),
        _taskDeletionAdapter = DeletionAdapter(
            database,
            'task_table',
            ['id'],
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'boardId': item.boardId,
                  'title': item.title,
                  'description': item.description,
                  'priority': item.priority.index,
                  'status': item.status.index,
                  'commentsCount': item.commentsCount,
                  'enableReminder': item.enableReminder ? 1 : 0,
                  'prevTaskId': item.prevTaskId,
                  'nextTaskId': item.nextTaskId,
                  'createdAt': _dateTimeConverter.encode(item.createdAt),
                  'updatedAt': _dateTimeConverter.encode(item.updatedAt),
                  'dueDate': _dateTimeConverter.encode(item.dueDate),
                  'inProgressAt': _dateTimeConverter.encode(item.inProgressAt),
                  'doneAt': _dateTimeConverter.encode(item.doneAt)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Task> _taskInsertionAdapter;

  final UpdateAdapter<Task> _taskUpdateAdapter;

  final DeletionAdapter<Task> _taskDeletionAdapter;

  @override
  Future<List<Task>> getTasks(int boardId) async {
    return _queryAdapter.queryList(
        'SELECT tt.*, COUNT(tct.taskId) AS commentsCount FROM task_table tt LEFT JOIN task_comments_table tct ON tt.id = tct.taskId WHERE tt.boardId = ?1  GROUP BY tt.id;',
        mapper: (Map<String, Object?> row) => Task(id: row['id'] as int, boardId: row['boardId'] as int, title: row['title'] as String, description: row['description'] as String, priority: TaskPriority.values[row['priority'] as int], status: TaskStatus.values[row['status'] as int], commentsCount: row['commentsCount'] as int, enableReminder: (row['enableReminder'] as int) != 0, prevTaskId: row['prevTaskId'] as int?, nextTaskId: row['nextTaskId'] as int?, createdAt: _dateTimeConverter.decode(row['createdAt'] as int?), updatedAt: _dateTimeConverter.decode(row['updatedAt'] as int?), dueDate: _dateTimeConverter.decode(row['dueDate'] as int?), inProgressAt: _dateTimeConverter.decode(row['inProgressAt'] as int?), doneAt: _dateTimeConverter.decode(row['doneAt'] as int?)),
        arguments: [boardId]);
  }

  @override
  Future<void> addTask(Task task) async {
    await _taskInsertionAdapter.insert(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTask(Task task) async {
    await _taskUpdateAdapter.update(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTask(Task task) async {
    await _taskDeletionAdapter.delete(task);
  }
}

class _$TaskCommentsDao extends TaskCommentsDao {
  _$TaskCommentsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskCommentInsertionAdapter = InsertionAdapter(
            database,
            'task_comments_table',
            (TaskComment item) => <String, Object?>{
                  'id': item.id,
                  'taskId': item.taskId,
                  'comment': item.comment,
                  'createdAt': _dateTimeConverter.encode(item.createdAt)
                }),
        _taskCommentUpdateAdapter = UpdateAdapter(
            database,
            'task_comments_table',
            ['id'],
            (TaskComment item) => <String, Object?>{
                  'id': item.id,
                  'taskId': item.taskId,
                  'comment': item.comment,
                  'createdAt': _dateTimeConverter.encode(item.createdAt)
                }),
        _taskCommentDeletionAdapter = DeletionAdapter(
            database,
            'task_comments_table',
            ['id'],
            (TaskComment item) => <String, Object?>{
                  'id': item.id,
                  'taskId': item.taskId,
                  'comment': item.comment,
                  'createdAt': _dateTimeConverter.encode(item.createdAt)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskComment> _taskCommentInsertionAdapter;

  final UpdateAdapter<TaskComment> _taskCommentUpdateAdapter;

  final DeletionAdapter<TaskComment> _taskCommentDeletionAdapter;

  @override
  Future<List<TaskComment>> getComments(int taskId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM task_comments_table WHERE taskId = ?1',
        mapper: (Map<String, Object?> row) => TaskComment(
            id: row['id'] as int,
            taskId: row['taskId'] as int,
            comment: row['comment'] as String,
            createdAt: _dateTimeConverter.decode(row['createdAt'] as int?)),
        arguments: [taskId]);
  }

  @override
  Future<void> addComment(TaskComment comment) async {
    await _taskCommentInsertionAdapter.insert(
        comment, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateComment(TaskComment comment) async {
    await _taskCommentUpdateAdapter.update(comment, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteComment(TaskComment comment) async {
    await _taskCommentDeletionAdapter.delete(comment);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _taskStatusConverter = TaskStatusConverter();
final _taskPriorityConverter = TaskPriorityConverter();
