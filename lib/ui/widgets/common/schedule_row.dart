import 'package:brana/ui/common/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleRow extends StatelessWidget {
  const ScheduleRow({
    super.key,
    required this.onSchedule,
    required this.onReminder,
    required this.onSubmit,
    required this.enableSubmit,
    this.isScheduled = false,
    this.isReminder = false,
  });

  final VoidCallback onSchedule;
  final VoidCallback onReminder;
  final VoidCallback onSubmit;
  final bool enableSubmit;
  final bool isScheduled;
  final bool isReminder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onSchedule,
                  child: Icon(
                    CupertinoIcons.calendar_badge_plus,
                    color: isScheduled ? theme.primaryColor : Colors.grey[600],
                  ),
                ),
                horizontalSpaceSmall,
                GestureDetector(
                  onTap: onReminder,
                  child: Icon(
                    CupertinoIcons.clock,
                    color: isReminder ? theme.primaryColor : Colors.grey[600],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: onSubmit,
              child: Icon(
                CupertinoIcons.arrow_right_circle_fill,
                color: enableSubmit ? theme.primaryColor : Colors.grey[600],
              ),
            )
          ],
        ),
        Divider(color: theme.primaryColorLight),
      ],
    );
  }
}
