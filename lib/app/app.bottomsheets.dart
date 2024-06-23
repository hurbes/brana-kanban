// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/add_comment/add_comment_sheet.dart';
import '../ui/bottom_sheets/add_task/add_task_sheet.dart';
import '../ui/bottom_sheets/add_task_board/add_task_board_sheet.dart';
import '../ui/bottom_sheets/date_picker/date_picker_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';

enum BottomSheetType {
  notice,
  addTaskBoard,
  addTask,
  datePicker,
  addComment,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.addTaskBoard: (context, request, completer) =>
        AddTaskBoardSheet(request: request, completer: completer),
    BottomSheetType.addTask: (context, request, completer) =>
        AddTaskSheet(request: request, completer: completer),
    BottomSheetType.datePicker: (context, request, completer) =>
        DatePickerSheet(request: request, completer: completer),
    BottomSheetType.addComment: (context, request, completer) =>
        AddCommentSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
