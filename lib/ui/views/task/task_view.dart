import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'task_viewmodel.dart';

class TaskView extends StackedView<TaskViewModel> {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TaskViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  TaskViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TaskViewModel();
}
