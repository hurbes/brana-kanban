import 'package:brana/ui/common/ui_helpers.dart';
import 'package:brana/ui/widgets/common/kanban_item/kanban_item.dart';
import 'package:brana/ui/widgets/kanban/brana_kanban_board.dart';
import 'package:brana/ui/widgets/kanban/brana_kanban_item.dart';
import 'package:brana/ui/widgets/kanban/brana_kanban_list.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';

import 'kanban_viewmodel.dart';

class KanbanView extends StackedView<KanbanViewModel> {
  final String title;
  final int id;
  const KanbanView({super.key, required this.title, required this.id});

  @override
  KanbanViewModel viewModelBuilder(BuildContext context) {
    return KanbanViewModel(boardId: id);
  }

  @override
  Widget builder(
    BuildContext context,
    KanbanViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: viewModel.goBack,
        ),
        title: Text(title),
        centerTitle: false,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: viewModel.openAddTaskBoardSheet,
        backgroundColor: theme.primaryColor,
        label: Text(
          'add_task'.tr(),
          style: theme.textTheme.labelLarge?.copyWith(color: theme.cardColor),
        ),
        icon: Icon(Icons.add, color: theme.primaryColorLight),
      ),
      body: BranaKanbanBoard(
          listPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          listDecoration: BoxDecoration(color: theme.primaryColorLight),
          itemDecorationWhileDragging: BoxDecoration(
            color: theme.primaryColorLight,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
              ),
            ],
          ),
          listWidth: screenHeightFraction(context, dividedBy: 4),
          axis: Axis.horizontal,
          itemDragOnLongPress: true,
          addLastItemTargetHeightToTop: false,
          contentsWhenEmpty: Center(
            child: Text(
              'no_tasks_found'.tr(),
              style: theme.textTheme.headlineLarge,
            ),
          ),
          listDividerOnLastChild: true,
          itemDivider: verticalSpaceSmall,
          onItemReorder: (reOrderIndex) {
            viewModel.reOrderTask(
              oldStatusIndex: reOrderIndex.oldListIndex,
              statusIndex: reOrderIndex.newListIndex,
              oldIndex: reOrderIndex.oldItemIndex,
              newIndex: reOrderIndex.newItemIndex,
            );
          },
          children: viewModel.taskMap.entries.map(
            (e) {
              return BranaKanbanList(
                decoration: const BoxDecoration(color: Colors.transparent),
                header: _GroupHeader(
                  count: e.value.length,
                  color: e.key.color,
                  name: e.key.name,
                ),
                children: e.value.map(
                  (task) {
                    return BranaKanbanItem(
                      child: KanbanItem(
                        task: task,
                        key: PageStorageKey(task.id),
                      ),
                    );
                  },
                ).toList(),
              );
            },
          ).toList()),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({
    required this.count,
    required this.color,
    required this.name,
  });

  final int count;
  final int color;
  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Color(color),
              shape: BoxShape.circle,
            ),
            child: Text(count.toString(), style: theme.textTheme.labelMedium),
          ),
          Text(name, style: theme.textTheme.headlineMedium)
        ],
      ),
    );
  }
}
