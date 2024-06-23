import 'package:brana/app/app.locator.dart';
import 'package:brana/app/app.router.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/core/services/task_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HistoryViewModel extends FutureViewModel<List<TaskBoard>> {
  final _taskService = locator<TaskService>();
  final _routerService = locator<RouterService>();

  void navigateToTaskBoard(TaskBoard board) {
    _routerService.navigateToTaskHistoryView(
      boardId: board.id,
      title: board.title,
    );
  }

  @override
  Future<List<TaskBoard>> futureToRun() => _taskService.getCompletedTaskBoard();
}
