import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/widgets/common/emoji_row.dart';
import 'package:brana/ui/widgets/common/schedule_row.dart';
import 'package:flutter/material.dart';
import 'package:brana/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:easy_localization/easy_localization.dart';

import 'add_task_board_sheet.form.dart';
import 'add_task_board_sheet_model.dart';

@FormView(fields: [
  FormTextField(name: 'title'),
  FormTextField(name: 'description'),
])
class AddTaskBoardSheet extends StackedView<AddTaskBoardSheetModel>
    with $AddTaskBoardSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const AddTaskBoardSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddTaskBoardSheetModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        height: 220,
        duration: const Duration(milliseconds: 100),
        color: theme.cardColor,
        child: _TaskBoardForm(
          titleController: titleController,
          descriptionController: descriptionController,
        ),
      ),
    );
  }

  @override
  void onViewModelReady(AddTaskBoardSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
    titleController.text = request.data?.title ?? '';
    descriptionController.text = request.data?.description ?? '';
    super.onViewModelReady(viewModel);
  }

  @override
  AddTaskBoardSheetModel viewModelBuilder(BuildContext context) {
    return AddTaskBoardSheetModel(request.data as TaskBoard?);
  }
}

class _TaskBoardForm extends ViewModelWidget<AddTaskBoardSheetModel> {
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const _TaskBoardForm({
    required this.titleController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context, AddTaskBoardSheetModel viewModel) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      children: [
        TextFormField(
          autofocus: true,
          controller: titleController,
          style: theme.textTheme.headlineMedium,
          decoration: InputDecoration(
            hintText: 'sweet_title_hint'.tr(),
            border: InputBorder.none,
            hintStyle: theme.textTheme.headlineMedium,
          ),
        ),
        TextFormField(
          autofocus: true,
          style: theme.textTheme.headlineMedium,
          controller: descriptionController,
          decoration: InputDecoration(
            hintText: 'description_hint'.tr(),
            border: InputBorder.none,
            hintStyle: theme.textTheme.headlineMedium,
          ),
        ),
        verticalSpaceSmall,
        ScheduleRow(
          onSchedule: viewModel.opeDatePicker,
          onReminder: viewModel.setReminder,
          onSubmit: viewModel.action,
          isScheduled: viewModel.isDateSelected,
          isReminder: viewModel.isReminderSelected,
          enableSubmit: viewModel.enableSubmit,
        ),
        EmojiRow(onChange: (emoji) => descriptionController.text += emoji)
      ],
    );
  }
}
