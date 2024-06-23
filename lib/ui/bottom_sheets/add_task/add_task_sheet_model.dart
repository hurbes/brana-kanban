import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/core/services/task_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddTaskSheetModel extends BaseViewModel {
  final _taskService = locator<TaskService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String _title = '';
  String _description = '';

  String get title => _title;
  String get description => _description;

  get enableSubmit => true;

  void setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  void setDescription(String value) {
    _description = value;
    notifyListeners();
  }

  TaskPriority _priority = TaskPriority.medium;

  TaskPriority get priority => _priority;

  void setPriority(TaskPriority priority) {
    _priority = priority;
    rebuildUi();
  }

  bool isSelected(TaskPriority priority) => _priority == priority;

  Future<void> addTask({required int lastIndex, required int boardId}) async {
    await runBusyFuture(
      _taskService.addTask(
        boardId: boardId,
        title: title,
        description: description,
        prevIndex: lastIndex,
        priority: priority,
      ),
      busyObject: this,
    );
    _bottomSheetService.completeSheet(SheetResponse(confirmed: true));
  }

  void action() {
    _bottomSheetService.completeSheet(SheetResponse(confirmed: true));
  }

  void closeSheet() {
    _bottomSheetService.completeSheet(SheetResponse(confirmed: false));
  }

  setEmoji(String p1) {}
}
