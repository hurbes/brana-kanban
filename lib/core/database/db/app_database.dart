import 'dart:async';

import 'package:brana/core/database/dao/task_boards_dao.dart';
import 'package:brana/core/database/dao/task_comments_dao.dart';
import 'package:brana/core/database/dao/tasks_dao.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/core/database/models/application_model_converters.dart';
import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@TypeConverters([DateTimeConverter, TaskStatusConverter, TaskPriorityConverter])
@Database(version: 1, entities: [
  Task,
  TaskBoard,
  TaskComment,
])
abstract class TaskDatabase extends FloorDatabase {
  TaskBoardDao get taskBoardDao;
  TasksDao get tasksDao;
  TaskCommentsDao get taskCommentsDao;
}
