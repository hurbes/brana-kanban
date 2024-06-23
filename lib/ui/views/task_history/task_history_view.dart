import 'package:brana/core/database/models/app_models.dart';
import 'package:brana/ui/common/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'task_history_viewmodel.dart';

class TaskHistoryView extends StackedView<TaskHistoryViewModel> {
  final int boardId;
  final String title;
  const TaskHistoryView({
    super.key,
    required this.boardId,
    required this.title,
  });

  @override
  Widget builder(
    BuildContext context,
    TaskHistoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: viewModel.goBack,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(title),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: viewModel.data?.length ?? 0,
        itemBuilder: (context, index) {
          final task = viewModel.data![index];

          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 16),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Title(task: task),
                verticalSpaceSmall,
                Text(task.description),
                verticalSpaceSmall,
                _DurationRow(
                  startTime: viewModel.getTime(task.inProgressAt!),
                  endTime: viewModel.getTime(task.doneAt!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  TaskHistoryViewModel viewModelBuilder(BuildContext context) {
    return TaskHistoryViewModel(boardId);
  }
}

class _DurationRow extends StatelessWidget {
  const _DurationRow({
    required this.startTime,
    required this.endTime,
  });

  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Icon(
              CupertinoIcons.clock_fill,
              size: 18,
              color: Colors.red,
            ),
            horizontalSpaceTiny,
            Text(startTime)
          ],
        ),
        const Text(' --- '),
        Row(
          children: [
            const Icon(
              CupertinoIcons.clock_fill,
              size: 18,
              color: Colors.green,
            ),
            horizontalSpaceTiny,
            Text(endTime)
          ],
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              CupertinoIcons.circle_fill,
              size: 14,
              color: Colors.green,
            ),
            horizontalSpaceTiny,
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        _Status(
          status: task.status.name,
          color: Color(task.status.color),
        )
      ],
    );
  }
}

class _Status extends StatelessWidget {
  const _Status({
    required this.status,
    required this.color,
  });

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
