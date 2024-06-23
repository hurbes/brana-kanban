import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/core/services/date_formater.dart';
import 'package:stacked/stacked.dart';

class TaskBoardItemModel extends BaseViewModel {
  final _dateFormatter = locator<DateFormatter>();

  final TaskBoard _board;

  TaskBoardItemModel(this._board);

  String get getCreateAtDate {
    if (_board.createdAt == null) return '';
    return _dateFormatter.dateToReadable(_board.createdAt!);
  }

  String get getDueTime {
    if (_board.dueDate == null) return '';
    return _dateFormatter.timeToReadable(_board.dueDate!);
  }
}
