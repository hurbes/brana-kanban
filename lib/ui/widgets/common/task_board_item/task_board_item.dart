import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/common/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'task_board_item_model.dart';

class TaskBoardItem extends StackedView<TaskBoardItemModel> {
  final TaskBoard board;
  final Color headerColor;
  final void Function(TaskBoard board) onTap;
  final void Function(TaskBoard board) onLongPress;

  const TaskBoardItem({
    super.key,
    this.headerColor = const Color(0xff24A19C),
    required this.board,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget builder(
    BuildContext context,
    TaskBoardItemModel viewModel,
    Widget? child,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: InkWell(
          onTap: () => onTap(board),
          onLongPress: () => onLongPress(board),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TaskBoardTitle(title: board.title, headerColor: headerColor),
              _TaskBoardDescription(description: board.description),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Divider(
                  thickness: .5,
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _DueDateTime(
                      showTime: board.dueDate != null,
                      isReminder: board.isReminder,
                      dueDate: viewModel.getDueTime,
                      taskCount: board.taskCount ?? 0,
                    ),
                    Text(
                      viewModel.getCreateAtDate,
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  TaskBoardItemModel viewModelBuilder(BuildContext context) {
    return TaskBoardItemModel(board);
  }
}

class _CommentCount extends StatelessWidget {
  const _CommentCount({required this.taskCount});

  final int taskCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(CupertinoIcons.table, color: Colors.grey, size: 16),
        horizontalSpaceTiny,
        Text(
          '$taskCount',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        )
      ],
    );
  }
}

class _DueDateTime extends StatelessWidget {
  const _DueDateTime({
    required this.isReminder,
    required this.dueDate,
    required this.showTime,
    this.taskCount = 0,
  });

  final bool isReminder;
  final String dueDate;
  final bool showTime;
  final int taskCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showTime) ...[
          Icon(
            CupertinoIcons.clock,
            color: isReminder ? Colors.redAccent : Colors.grey[600],
            size: 16,
          ),
          horizontalSpaceTiny,
          Text(
            dueDate,
            style: TextStyle(
              fontSize: 12,
              color: isReminder ? Colors.redAccent : Colors.grey[600],
            ),
          ),
          horizontalSpaceSmall,
        ],
        _CommentCount(taskCount: taskCount),
      ],
    );
  }
}

class _TaskBoardDescription extends StatelessWidget {
  const _TaskBoardDescription({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.circle_fill,
            color: Color(0xff24A19C),
            size: 16,
          ),
          horizontalSpaceTiny,
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class _TaskBoardTitle extends StatelessWidget {
  const _TaskBoardTitle({required this.title, required this.headerColor});

  final String title;
  final Color headerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: headerColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          const Icon(CupertinoIcons.flag, color: Colors.white, size: 16),
          horizontalSpaceTiny,
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
