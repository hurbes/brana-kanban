import 'brana_kanban_interface.dart';
import 'package:flutter/widgets.dart';

class BranaKanbanItem implements BranaKanbanInterface {
  final Widget child;
  final Widget? feedbackWidget;
  final bool canDrag;
  final Key? key;

  BranaKanbanItem({
    required this.child,
    this.feedbackWidget,
    this.canDrag = true,
    this.key,
  });
}
