import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/widgets/common/emoji_row.dart';
import 'package:brana/ui/widgets/common/schedule_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brana/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:easy_localization/easy_localization.dart';

import 'add_task_sheet.form.dart';
import 'add_task_sheet_model.dart';

@FormView(fields: [
  FormTextField(name: 'title'),
  FormTextField(name: 'description'),
])
class AddTaskSheet extends StackedView<AddTaskSheetModel> with $AddTaskSheet {
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
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        height: 340,
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: _TaskForm(
          boardId: request.data['boardId'],
          lastIndex: request.data['lastIndex'],
          titleController: titleController,
          descriptionController: descriptionController,
        ),
      ),
    );
  }

  @override
  void onDispose(AddTaskSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onDispose(viewModel);
  }

  @override
  AddTaskSheetModel viewModelBuilder(BuildContext context) {
    return AddTaskSheetModel();
  }
}

class _TaskForm extends ViewModelWidget<AddTaskSheetModel> {
  final int boardId;
  final int lastIndex;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const _TaskForm({
    required this.boardId,
    required this.lastIndex,
    required this.titleController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context, AddTaskSheetModel viewModel) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'add_task'.tr(),
              style: theme.textTheme.headlineMedium,
            ),
            IconButton(
              onPressed: viewModel.closeSheet,
              icon: Icon(CupertinoIcons.xmark, color: theme.primaryColorLight),
            ),
          ],
        ),
        TextField(
          autofocus: true,
          controller: titleController,
          style: theme.textTheme.headlineMedium,
          decoration: InputDecoration(
            hintText: 'sweet_title_hint'.tr(),
            border: InputBorder.none,
            hintStyle: theme.textTheme.labelLarge,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Icon(
                CupertinoIcons.tag_circle_fill,
                color: theme.primaryColor,
              ),
            ),
          ),
        ),
        TextField(
          autofocus: true,
          style: theme.textTheme.bodyMedium,
          controller: descriptionController,
          decoration: InputDecoration(
            hintText: 'description_hint'.tr(),
            border: InputBorder.none,
            hintStyle: theme.textTheme.labelMedium,
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
                isScheduled: viewModel.isDateSelected,
                isReminder: viewModel.isReminderSelected,
                onSchedule: viewModel.scheduleReminderSheet,
                onReminder: viewModel.setReminder,
                onSubmit: () => viewModel.addTask(
                  lastIndex: lastIndex,
                  boardId: boardId,
                  titleValue: titleController.text,
                  descriptionValue: descriptionController.text,
                ),
                enableSubmit: titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty,
              ),
              verticalSpaceSmall,
            ],
          ),
        ),
        EmojiRow(onChange: (emoji) => descriptionController.text += emoji),
      ],
    );
  }
}

class _PriorityRow extends ViewModelWidget<AddTaskSheetModel> {
  const _PriorityRow();

  @override
  Widget build(BuildContext context, AddTaskSheetModel viewModel) {
    final theme = Theme.of(context);
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
              style: theme.textTheme.labelSmall,
            ),
          ),
        );
      }).toList(),
    );
  }
}
