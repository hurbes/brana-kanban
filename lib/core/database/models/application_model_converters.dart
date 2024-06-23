import 'package:brana/core/database/models/app_models.dart';
import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter extends TypeConverter<DateTime?, int?> {
  @override
  DateTime? decode(int? databaseValue) {
    if (databaseValue == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(databaseValue);
  }

  @override
  int? encode(DateTime? value) {
    return value?.millisecondsSinceEpoch;
  }
}

class TaskStatusConverter extends TypeConverter<TaskStatus?, String?> {
  @override
  TaskStatus? decode(String? databaseValue) {
    return databaseValue == null
        ? null
        : TaskStatus.values.byName(databaseValue);
  }

  @override
  String? encode(TaskStatus? value) {
    return value?.name;
  }
}

class TaskPriorityConverter extends TypeConverter<TaskPriority?, String?> {
  @override
  TaskPriority? decode(String? databaseValue) {
    return databaseValue == null
        ? null
        : TaskPriority.values.byName(databaseValue);
  }

  @override
  String? encode(TaskPriority? value) {
    return value?.name;
  }
}

class UnixToDateTimeConverter implements JsonConverter<DateTime?, int?> {
  const UnixToDateTimeConverter();

  @override
  DateTime? fromJson(int? unixTimeStamp) {
    return unixTimeStamp != null
        ? DateTime.fromMillisecondsSinceEpoch(unixTimeStamp)
        : null;
  }

  @override
  int? toJson(DateTime? dateTime) {
    return dateTime?.millisecondsSinceEpoch;
  }
}
