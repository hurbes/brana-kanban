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
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.2),
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
                  color: theme.primaryColorLight.withOpacity(0.3),
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
                      style: theme.textTheme.labelSmall,
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
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(CupertinoIcons.table, size: 16, color: theme.primaryColorLight),
        horizontalSpaceTiny,
        Text(
          '$taskCount',
          style: theme.textTheme.labelSmall,
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
    final theme = Theme.of(context);
    return Row(
      children: [
        if (showTime) ...[
          Icon(
            CupertinoIcons.clock,
            color: isReminder ? Colors.redAccent : theme.primaryColorLight,
            size: 16,
          ),
          horizontalSpaceTiny,
          Text(
            dueDate,
            style: theme.textTheme.labelSmall?.copyWith(
              color: isReminder ? Colors.redAccent : theme.primaryColorLight,
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
    final theme = Theme.of(context);
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
          Text(description, style: theme.textTheme.bodyMedium)
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
    final theme = Theme.of(context);
    return Container(
      height: 36,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: headerColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          const Icon(CupertinoIcons.flag, color: Colors.black, size: 16),
          horizontalSpaceTiny,
          Text(
            title,
            style: theme.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
