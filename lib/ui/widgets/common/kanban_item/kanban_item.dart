import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/common/ui_helpers.dart';
import 'package:brana/ui/widgets/common/time_tracker/time_tracker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'kanban_item_model.dart';

class KanbanItem extends StackedView<KanbanItemModel> {
  final Task task;
  const KanbanItem({super.key, required this.task});

  @override
  bool get disposeViewModel => false;

  @override
  bool get fireOnViewModelReadyOnce => true;

  @override
  Widget builder(
    BuildContext context,
    KanbanItemModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Material(
      elevation: 0.1,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: viewModel.addComments,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title, style: theme.textTheme.titleSmall),
              verticalSpaceTiny,
              Text(task.description, style: theme.textTheme.bodyMedium),
              verticalSpaceSmall,
              if (task.status == TaskStatus.inProgress)
                TimeTracker(inProgressAt: task.inProgressAt!),
              if (task.status == TaskStatus.done)
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.check_mark_circled,
                      color: theme.primaryColorLight,
                      size: 18,
                    ),
                    horizontalSpaceTiny,
                    Text(
                      viewModel.doneTime,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              verticalSpaceSmall,
              _TagRow(task: task),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    CupertinoIcons.text_bubble,
                    color: theme.primaryColorLight,
                    size: 18,
                  ),
                  horizontalSpaceTiny,
                  Text(
                    task.commentsCount.toString(),
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(KanbanItemModel viewModel) {
    viewModel.init(task);
    super.onViewModelReady(viewModel);
  }

  @override
  KanbanItemModel viewModelBuilder(BuildContext context) {
    return locator<KanbanItemModel>();
  }
}

class _TagRow extends StatelessWidget {
  const _TagRow({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff24A19C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            task.status.name,
            style: theme.textTheme.labelSmall,
          ),
        ),
        horizontalSpaceTiny,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Color(task.priority.color),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            task.priority.name,
            style: theme.textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}
