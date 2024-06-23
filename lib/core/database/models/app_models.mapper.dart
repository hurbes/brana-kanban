// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_models.dart';

class TaskStatusMapper extends EnumMapper<TaskStatus> {
  TaskStatusMapper._();

  static TaskStatusMapper? _instance;
  static TaskStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskStatusMapper._());
    }
    return _instance!;
  }

  static TaskStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TaskStatus decode(dynamic value) {
    switch (value) {
      case 'todo':
        return TaskStatus.todo;
      case 'inProgress':
        return TaskStatus.inProgress;
      case 'done':
        return TaskStatus.done;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TaskStatus self) {
    switch (self) {
      case TaskStatus.todo:
        return 'todo';
      case TaskStatus.inProgress:
        return 'inProgress';
      case TaskStatus.done:
        return 'done';
    }
  }
}

extension TaskStatusMapperExtension on TaskStatus {
  String toValue() {
    TaskStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TaskStatus>(this) as String;
  }
}

class TaskPriorityMapper extends EnumMapper<TaskPriority> {
  TaskPriorityMapper._();

  static TaskPriorityMapper? _instance;
  static TaskPriorityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskPriorityMapper._());
    }
    return _instance!;
  }

  static TaskPriority fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TaskPriority decode(dynamic value) {
    switch (value) {
      case 'low':
        return TaskPriority.low;
      case 'medium':
        return TaskPriority.medium;
      case 'high':
        return TaskPriority.high;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TaskPriority self) {
    switch (self) {
      case TaskPriority.low:
        return 'low';
      case TaskPriority.medium:
        return 'medium';
      case TaskPriority.high:
        return 'high';
    }
  }
}

extension TaskPriorityMapperExtension on TaskPriority {
  String toValue() {
    TaskPriorityMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TaskPriority>(this) as String;
  }
}

class TaskBoardMapper extends ClassMapperBase<TaskBoard> {
  TaskBoardMapper._();

  static TaskBoardMapper? _instance;
  static TaskBoardMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskBoardMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TaskBoard';

  static int _$id(TaskBoard v) => v.id;
  static const Field<TaskBoard, int> _f$id = Field('id', _$id);
  static String _$title(TaskBoard v) => v.title;
  static const Field<TaskBoard, String> _f$title = Field('title', _$title);
  static String _$description(TaskBoard v) => v.description;
  static const Field<TaskBoard, String> _f$description =
      Field('description', _$description);
  static int? _$taskCount(TaskBoard v) => v.taskCount;
  static const Field<TaskBoard, int> _f$taskCount =
      Field('taskCount', _$taskCount, opt: true);
  static DateTime? _$createdAt(TaskBoard v) => v.createdAt;
  static const Field<TaskBoard, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static DateTime? _$updatedAt(TaskBoard v) => v.updatedAt;
  static const Field<TaskBoard, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt);
  static DateTime? _$dueDate(TaskBoard v) => v.dueDate;
  static const Field<TaskBoard, DateTime> _f$dueDate =
      Field('dueDate', _$dueDate, opt: true);
  static bool _$isCompleted(TaskBoard v) => v.isCompleted;
  static const Field<TaskBoard, bool> _f$isCompleted =
      Field('isCompleted', _$isCompleted, opt: true, def: false);
  static bool _$isReminder(TaskBoard v) => v.isReminder;
  static const Field<TaskBoard, bool> _f$isReminder =
      Field('isReminder', _$isReminder, opt: true, def: false);

  @override
  final MappableFields<TaskBoard> fields = const {
    #id: _f$id,
    #title: _f$title,
    #description: _f$description,
    #taskCount: _f$taskCount,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #dueDate: _f$dueDate,
    #isCompleted: _f$isCompleted,
    #isReminder: _f$isReminder,
  };

  static TaskBoard _instantiate(DecodingData data) {
    return TaskBoard(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        taskCount: data.dec(_f$taskCount),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        dueDate: data.dec(_f$dueDate),
        isCompleted: data.dec(_f$isCompleted),
        isReminder: data.dec(_f$isReminder));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskBoard fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskBoard>(map);
  }

  static TaskBoard fromJson(String json) {
    return ensureInitialized().decodeJson<TaskBoard>(json);
  }
}

mixin TaskBoardMappable {
  String toJson() {
    return TaskBoardMapper.ensureInitialized()
        .encodeJson<TaskBoard>(this as TaskBoard);
  }

  Map<String, dynamic> toMap() {
    return TaskBoardMapper.ensureInitialized()
        .encodeMap<TaskBoard>(this as TaskBoard);
  }

  TaskBoardCopyWith<TaskBoard, TaskBoard, TaskBoard> get copyWith =>
      _TaskBoardCopyWithImpl(this as TaskBoard, $identity, $identity);
  @override
  String toString() {
    return TaskBoardMapper.ensureInitialized()
        .stringifyValue(this as TaskBoard);
  }

  @override
  bool operator ==(Object other) {
    return TaskBoardMapper.ensureInitialized()
        .equalsValue(this as TaskBoard, other);
  }

  @override
  int get hashCode {
    return TaskBoardMapper.ensureInitialized().hashValue(this as TaskBoard);
  }
}

extension TaskBoardValueCopy<$R, $Out> on ObjectCopyWith<$R, TaskBoard, $Out> {
  TaskBoardCopyWith<$R, TaskBoard, $Out> get $asTaskBoard =>
      $base.as((v, t, t2) => _TaskBoardCopyWithImpl(v, t, t2));
}

abstract class TaskBoardCopyWith<$R, $In extends TaskBoard, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? title,
      String? description,
      int? taskCount,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? dueDate,
      bool? isCompleted,
      bool? isReminder});
  TaskBoardCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskBoardCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskBoard, $Out>
    implements TaskBoardCopyWith<$R, TaskBoard, $Out> {
  _TaskBoardCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskBoard> $mapper =
      TaskBoardMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? title,
          String? description,
          Object? taskCount = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? dueDate = $none,
          bool? isCompleted,
          bool? isReminder}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (description != null) #description: description,
        if (taskCount != $none) #taskCount: taskCount,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (dueDate != $none) #dueDate: dueDate,
        if (isCompleted != null) #isCompleted: isCompleted,
        if (isReminder != null) #isReminder: isReminder
      }));
  @override
  TaskBoard $make(CopyWithData data) => TaskBoard(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      description: data.get(#description, or: $value.description),
      taskCount: data.get(#taskCount, or: $value.taskCount),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      dueDate: data.get(#dueDate, or: $value.dueDate),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted),
      isReminder: data.get(#isReminder, or: $value.isReminder));

  @override
  TaskBoardCopyWith<$R2, TaskBoard, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskBoardCopyWithImpl($value, $cast, t);
}

class TaskMapper extends ClassMapperBase<Task> {
  TaskMapper._();

  static TaskMapper? _instance;
  static TaskMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskMapper._());
      TaskPriorityMapper.ensureInitialized();
      TaskStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Task';

  static int _$id(Task v) => v.id;
  static const Field<Task, int> _f$id = Field('id', _$id);
  static int _$boardId(Task v) => v.boardId;
  static const Field<Task, int> _f$boardId = Field('boardId', _$boardId);
  static String _$title(Task v) => v.title;
  static const Field<Task, String> _f$title = Field('title', _$title);
  static String _$description(Task v) => v.description;
  static const Field<Task, String> _f$description =
      Field('description', _$description);
  static TaskPriority _$priority(Task v) => v.priority;
  static const Field<Task, TaskPriority> _f$priority =
      Field('priority', _$priority, opt: true, def: TaskPriority.medium);
  static TaskStatus _$status(Task v) => v.status;
  static const Field<Task, TaskStatus> _f$status =
      Field('status', _$status, opt: true, def: TaskStatus.todo);
  static int _$commentsCount(Task v) => v.commentsCount;
  static const Field<Task, int> _f$commentsCount =
      Field('commentsCount', _$commentsCount, opt: true, def: 0);
  static bool _$enableReminder(Task v) => v.enableReminder;
  static const Field<Task, bool> _f$enableReminder =
      Field('enableReminder', _$enableReminder, opt: true, def: true);
  static int? _$prevTaskId(Task v) => v.prevTaskId;
  static const Field<Task, int> _f$prevTaskId =
      Field('prevTaskId', _$prevTaskId, opt: true);
  static int? _$nextTaskId(Task v) => v.nextTaskId;
  static const Field<Task, int> _f$nextTaskId =
      Field('nextTaskId', _$nextTaskId, opt: true);
  static DateTime? _$createdAt(Task v) => v.createdAt;
  static const Field<Task, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static DateTime? _$updatedAt(Task v) => v.updatedAt;
  static const Field<Task, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt);
  static DateTime? _$dueDate(Task v) => v.dueDate;
  static const Field<Task, DateTime> _f$dueDate = Field('dueDate', _$dueDate);
  static DateTime? _$inProgressAt(Task v) => v.inProgressAt;
  static const Field<Task, DateTime> _f$inProgressAt =
      Field('inProgressAt', _$inProgressAt, opt: true);
  static DateTime? _$doneAt(Task v) => v.doneAt;
  static const Field<Task, DateTime> _f$doneAt =
      Field('doneAt', _$doneAt, opt: true);

  @override
  final MappableFields<Task> fields = const {
    #id: _f$id,
    #boardId: _f$boardId,
    #title: _f$title,
    #description: _f$description,
    #priority: _f$priority,
    #status: _f$status,
    #commentsCount: _f$commentsCount,
    #enableReminder: _f$enableReminder,
    #prevTaskId: _f$prevTaskId,
    #nextTaskId: _f$nextTaskId,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #dueDate: _f$dueDate,
    #inProgressAt: _f$inProgressAt,
    #doneAt: _f$doneAt,
  };

  static Task _instantiate(DecodingData data) {
    return Task(
        id: data.dec(_f$id),
        boardId: data.dec(_f$boardId),
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        priority: data.dec(_f$priority),
        status: data.dec(_f$status),
        commentsCount: data.dec(_f$commentsCount),
        enableReminder: data.dec(_f$enableReminder),
        prevTaskId: data.dec(_f$prevTaskId),
        nextTaskId: data.dec(_f$nextTaskId),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        dueDate: data.dec(_f$dueDate),
        inProgressAt: data.dec(_f$inProgressAt),
        doneAt: data.dec(_f$doneAt));
  }

  @override
  final Function instantiate = _instantiate;

  static Task fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Task>(map);
  }

  static Task fromJson(String json) {
    return ensureInitialized().decodeJson<Task>(json);
  }
}

mixin TaskMappable {
  String toJson() {
    return TaskMapper.ensureInitialized().encodeJson<Task>(this as Task);
  }

  Map<String, dynamic> toMap() {
    return TaskMapper.ensureInitialized().encodeMap<Task>(this as Task);
  }

  TaskCopyWith<Task, Task, Task> get copyWith =>
      _TaskCopyWithImpl(this as Task, $identity, $identity);
  @override
  String toString() {
    return TaskMapper.ensureInitialized().stringifyValue(this as Task);
  }

  @override
  bool operator ==(Object other) {
    return TaskMapper.ensureInitialized().equalsValue(this as Task, other);
  }

  @override
  int get hashCode {
    return TaskMapper.ensureInitialized().hashValue(this as Task);
  }
}

extension TaskValueCopy<$R, $Out> on ObjectCopyWith<$R, Task, $Out> {
  TaskCopyWith<$R, Task, $Out> get $asTask =>
      $base.as((v, t, t2) => _TaskCopyWithImpl(v, t, t2));
}

abstract class TaskCopyWith<$R, $In extends Task, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      int? boardId,
      String? title,
      String? description,
      TaskPriority? priority,
      TaskStatus? status,
      int? commentsCount,
      bool? enableReminder,
      int? prevTaskId,
      int? nextTaskId,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? dueDate,
      DateTime? inProgressAt,
      DateTime? doneAt});
  TaskCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Task, $Out>
    implements TaskCopyWith<$R, Task, $Out> {
  _TaskCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Task> $mapper = TaskMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          int? boardId,
          String? title,
          String? description,
          TaskPriority? priority,
          TaskStatus? status,
          int? commentsCount,
          bool? enableReminder,
          Object? prevTaskId = $none,
          Object? nextTaskId = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? dueDate = $none,
          Object? inProgressAt = $none,
          Object? doneAt = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (boardId != null) #boardId: boardId,
        if (title != null) #title: title,
        if (description != null) #description: description,
        if (priority != null) #priority: priority,
        if (status != null) #status: status,
        if (commentsCount != null) #commentsCount: commentsCount,
        if (enableReminder != null) #enableReminder: enableReminder,
        if (prevTaskId != $none) #prevTaskId: prevTaskId,
        if (nextTaskId != $none) #nextTaskId: nextTaskId,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (dueDate != $none) #dueDate: dueDate,
        if (inProgressAt != $none) #inProgressAt: inProgressAt,
        if (doneAt != $none) #doneAt: doneAt
      }));
  @override
  Task $make(CopyWithData data) => Task(
      id: data.get(#id, or: $value.id),
      boardId: data.get(#boardId, or: $value.boardId),
      title: data.get(#title, or: $value.title),
      description: data.get(#description, or: $value.description),
      priority: data.get(#priority, or: $value.priority),
      status: data.get(#status, or: $value.status),
      commentsCount: data.get(#commentsCount, or: $value.commentsCount),
      enableReminder: data.get(#enableReminder, or: $value.enableReminder),
      prevTaskId: data.get(#prevTaskId, or: $value.prevTaskId),
      nextTaskId: data.get(#nextTaskId, or: $value.nextTaskId),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      dueDate: data.get(#dueDate, or: $value.dueDate),
      inProgressAt: data.get(#inProgressAt, or: $value.inProgressAt),
      doneAt: data.get(#doneAt, or: $value.doneAt));

  @override
  TaskCopyWith<$R2, Task, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TaskCopyWithImpl($value, $cast, t);
}

class TaskCommentMapper extends ClassMapperBase<TaskComment> {
  TaskCommentMapper._();

  static TaskCommentMapper? _instance;
  static TaskCommentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskCommentMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TaskComment';

  static int _$id(TaskComment v) => v.id;
  static const Field<TaskComment, int> _f$id = Field('id', _$id);
  static int _$taskId(TaskComment v) => v.taskId;
  static const Field<TaskComment, int> _f$taskId = Field('taskId', _$taskId);
  static String _$comment(TaskComment v) => v.comment;
  static const Field<TaskComment, String> _f$comment =
      Field('comment', _$comment);
  static DateTime? _$createdAt(TaskComment v) => v.createdAt;
  static const Field<TaskComment, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);

  @override
  final MappableFields<TaskComment> fields = const {
    #id: _f$id,
    #taskId: _f$taskId,
    #comment: _f$comment,
    #createdAt: _f$createdAt,
  };

  static TaskComment _instantiate(DecodingData data) {
    return TaskComment(
        id: data.dec(_f$id),
        taskId: data.dec(_f$taskId),
        comment: data.dec(_f$comment),
        createdAt: data.dec(_f$createdAt));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskComment fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskComment>(map);
  }

  static TaskComment fromJson(String json) {
    return ensureInitialized().decodeJson<TaskComment>(json);
  }
}

mixin TaskCommentMappable {
  String toJson() {
    return TaskCommentMapper.ensureInitialized()
        .encodeJson<TaskComment>(this as TaskComment);
  }

  Map<String, dynamic> toMap() {
    return TaskCommentMapper.ensureInitialized()
        .encodeMap<TaskComment>(this as TaskComment);
  }

  TaskCommentCopyWith<TaskComment, TaskComment, TaskComment> get copyWith =>
      _TaskCommentCopyWithImpl(this as TaskComment, $identity, $identity);
  @override
  String toString() {
    return TaskCommentMapper.ensureInitialized()
        .stringifyValue(this as TaskComment);
  }

  @override
  bool operator ==(Object other) {
    return TaskCommentMapper.ensureInitialized()
        .equalsValue(this as TaskComment, other);
  }

  @override
  int get hashCode {
    return TaskCommentMapper.ensureInitialized().hashValue(this as TaskComment);
  }
}

extension TaskCommentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskComment, $Out> {
  TaskCommentCopyWith<$R, TaskComment, $Out> get $asTaskComment =>
      $base.as((v, t, t2) => _TaskCommentCopyWithImpl(v, t, t2));
}

abstract class TaskCommentCopyWith<$R, $In extends TaskComment, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, int? taskId, String? comment, DateTime? createdAt});
  TaskCommentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskCommentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskComment, $Out>
    implements TaskCommentCopyWith<$R, TaskComment, $Out> {
  _TaskCommentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskComment> $mapper =
      TaskCommentMapper.ensureInitialized();
  @override
  $R call({int? id, int? taskId, String? comment, Object? createdAt = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (taskId != null) #taskId: taskId,
        if (comment != null) #comment: comment,
        if (createdAt != $none) #createdAt: createdAt
      }));
  @override
  TaskComment $make(CopyWithData data) => TaskComment(
      id: data.get(#id, or: $value.id),
      taskId: data.get(#taskId, or: $value.taskId),
      comment: data.get(#comment, or: $value.comment),
      createdAt: data.get(#createdAt, or: $value.createdAt));

  @override
  TaskCommentCopyWith<$R2, TaskComment, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskCommentCopyWithImpl($value, $cast, t);
}
