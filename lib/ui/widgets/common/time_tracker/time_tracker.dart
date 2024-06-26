import 'package:brana/ui/common/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'time_tracker_model.dart';

class TimeTracker extends StackedView<TimeTrackerModel> {
  final DateTime inProgressAt;
  const TimeTracker({super.key, required this.inProgressAt});

  @override
  Widget builder(
    BuildContext context,
    TimeTrackerModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          CupertinoIcons.stopwatch,
          size: 15,
          color: theme.primaryColorLight,
        ),
        horizontalSpaceTiny,
        Text(
          viewModel.formattedTime,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }

  @override
  TimeTrackerModel viewModelBuilder(BuildContext context) {
    return TimeTrackerModel(inProgressAt);
  }
}
