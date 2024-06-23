import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/core/mixins/app_logger.dart';
import 'package:brana/core/services/date_formater.dart';
import 'package:brana/core/services/task_service.dart';
import 'package:stacked/stacked.dart';
import 'add_comment_sheet.form.dart';

class AddCommentSheetModel extends FutureViewModel<List<TaskComment>>
    with AppLogger, FormStateHelper
    implements FormViewModel {
  final Task _taskId;

  AddCommentSheetModel(this._taskId);

  final _taskService = locator<TaskService>();
  final _dateFormatter = locator<DateFormatter>();

  bool get enableSubmit => commentValue != null && commentValue!.isNotEmpty;

  Future<void> addComment() async {
    if (!enableSubmit) return;
    try {
      await _taskService.addComment(
        TaskComment(
          id: DateTime.now().microsecondsSinceEpoch,
          taskId: _taskId.id,
          comment: commentValue!,
          createdAt: DateTime.now(),
        ),
      );

      await initialise();
    } catch (e) {
      log.e('addComment error: $e');
    }
  }

  String getCommentDate(DateTime date) {
    return _dateFormatter.dateToReadable(date);
  }

  @override
  void onData(List<TaskComment>? data) {
    log.v('onData $data');
    super.onData(data);
  }

  @override
  void onError(error) {
    log.e('onError $error');
    super.onError(error);
  }

  @override
  Future<List<TaskComment>> futureToRun() {
    return _taskService.getComments(_taskId.id);
  }

  deleteComment(TaskComment comment) {}
}
