import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/widgets/common/emoji_row.dart';
import 'package:brana/ui/widgets/common/schedule_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brana/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:easy_localization/easy_localization.dart';

import 'add_task_sheet_model.dart';

class AddTaskSheet extends StackedView<AddTaskSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const AddTaskSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(
    BuildContext context,
    AddTaskSheetModel viewModel,
    Widget? child,
  ) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        height: 280,
        duration: const Duration(milliseconds: 100),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: _TaskForm(
          boardId: request.data['boardId'],
          lastIndex: request.data['lastIndex'],
          onComplete: () => completer!(SheetResponse(confirmed: true)),
        ),
      ),
    );
  }

  @override
  AddTaskSheetModel viewModelBuilder(BuildContext context) {
    return AddTaskSheetModel();
  }
}

class _TaskForm extends ViewModelWidget<AddTaskSheetModel> {
  final int boardId;
  final int lastIndex;
  final VoidCallback onComplete;

  const _TaskForm({
    required this.boardId,
    required this.lastIndex,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context, AddTaskSheetModel viewModel) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'add_task'.tr(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: viewModel.closeSheet,
              icon: const Icon(CupertinoIcons.xmark, color: Colors.grey),
            ),
          ],
        ),
        TextField(
          autofocus: true,
          onChanged: viewModel.setTitle,
          decoration: InputDecoration(
            hintText: 'sweet_title_hint'.tr(),
            border: InputBorder.none,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(
                CupertinoIcons.tag_circle_fill,
                color: Color(0xff24A19C),
              ),
            ),
          ),
        ),
        TextField(
          autofocus: true,
          onChanged: viewModel.setDescription,
          decoration: InputDecoration(
            hintText: 'description_hint'.tr(),
            border: InputBorder.none,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const SizedBox.shrink(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              const _PriorityRow(),
              verticalSpaceMedium,
              ScheduleRow(
                onSchedule: () {},
                onReminder: () {},
                onSubmit: () => viewModel.addTask(
                  lastIndex: lastIndex,
                  boardId: boardId,
                ),
                enableSubmit: viewModel.enableSubmit,
              ),
              verticalSpaceSmall,
            ],
          ),
        ),
        EmojiRow(onChange: viewModel.setEmoji),
      ],
    );
  }
}

class _PriorityRow extends ViewModelWidget<AddTaskSheetModel> {
  const _PriorityRow();

  @override
  Widget build(BuildContext context, AddTaskSheetModel viewModel) {
    return Wrap(
      spacing: 6,
      children: TaskPriority.values.map((priority) {
        return InkWell(
          onTap: () => viewModel.setPriority(priority),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(priority.color),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: viewModel.isSelected(priority)
                    ? const Color(0xff24A19C)
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Text(
              '${priority.icon} ${priority.name}',
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        );
      }).toList(),
    );
  }
}
