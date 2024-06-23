import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/core/services/date_formater.dart';
import 'package:brana/core/services/task_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TaskHistoryViewModel extends FutureViewModel<List<Task>> {
  final int _boardId;

  TaskHistoryViewModel(this._boardId);

  final _taskService = locator<TaskService>();
  final _routerService = locator<RouterService>();
  final _dateFormatter = locator<DateFormatter>();

  String getTime(DateTime date) {
    return _dateFormatter.timeToReadable(date);
  }

  void goBack() {
    _routerService.back();
  }

  @override
  void onData(List<Task>? data) {
    data?.removeWhere((data) => data.status != TaskStatus.done);
    super.onData(data);
  }

  @override
  Future<List<Task>> futureToRun() => _taskService.getTasks(_boardId);
}
