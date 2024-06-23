import 'package:brana/app/app.bottomsheets.dart';
import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class KanbanItemModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  late Task _task;

  KanbanItemModel();

  void init(Task task) {
    _task = task;
  }

  String get doneTime {
    if (_task.doneAt == null) return '';
    final duration = _task.doneAt!.difference(_task.inProgressAt!);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void openDetails() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.addTask,
      data: _task,
    );
  }

  void addComments() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.addComment,
      data: _task,
    );
  }
}
