import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/widgets/common/emoji_row.dart';
import 'package:brana/ui/widgets/common/schedule_row.dart';
import 'package:flutter/material.dart';
import 'package:brana/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_task_board_sheet.form.dart';
import 'add_task_board_sheet_model.dart';

@FormView(fields: [
  FormTextField(name: 'title'),
  FormTextField(name: 'description'),
  FormDateField(name: 'date'),
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        height: 220,
        duration: const Duration(milliseconds: 100),
        color: Colors.white,
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
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      children: [
        TextFormField(
          autofocus: true,
          controller: titleController,
          decoration: InputDecoration(
            hintText: 'A Sweet Title',
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        TextFormField(
          autofocus: true,
          controller: descriptionController,
          decoration: InputDecoration(
            hintText: 'Some description',
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w400,
            ),
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
