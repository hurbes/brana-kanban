import 'brana_kanban_parameters.dart';
import 'brana_kanban_item.dart';
import 'brana_kanban_list_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BranaKanbanTargetItem extends HookWidget {
  final Widget child;
  final BranaKanbanItemInterface? parent;
  final BranaKanbanParameters parameters;
  final OnItemDropOnLastTarget onReorderOrAdd;

  const BranaKanbanTargetItem({
    required this.child,
    required this.onReorderOrAdd,
    required this.parameters,
    this.parent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hoveredDraggable = useState<BranaKanbanItem?>(null);

    return Stack(
      children: <Widget>[
        _TargetItemColumn(
          parameters: parameters,
          hoveredDraggable: hoveredDraggable,
          child: child,
        ),
        Positioned.fill(
          child: DragTarget<BranaKanbanItem>(
            builder: (context, candidateData, rejectedData) {
              if (candidateData.isNotEmpty) {}
              return Container();
            },
            onWillAcceptWithDetails: (details) {
              bool accept = true;
              if (parameters.itemTargetOnWillAccept != null) {
                accept = parameters.itemTargetOnWillAccept!(details.data, this);
              }
              if (accept) {
                hoveredDraggable.value = details.data;
              }
              return accept;
            },
            onLeave: (data) {
              hoveredDraggable.value = null;
            },
            onAcceptWithDetails: (details) {
              onReorderOrAdd(details.data, parent!, this);
              hoveredDraggable.value = null;
            },
          ),
        ),
      ],
    );
  }
}

class _TargetItemColumn extends StatelessWidget {
  const _TargetItemColumn({
    required this.parameters,
    required this.hoveredDraggable,
    required this.child,
  });

  final BranaKanbanParameters parameters;
  final ValueNotifier<BranaKanbanItem?> hoveredDraggable;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: parameters.verticalAlignment,
      children: <Widget>[
        AnimatedSize(
          duration: Duration(
            milliseconds: parameters.itemSizeAnimationDuration,
          ),
          alignment: Alignment.bottomCenter,
          child: hoveredDraggable.value != null
              ? Opacity(
                  opacity: parameters.itemGhostOpacity,
                  child: parameters.itemGhost ?? hoveredDraggable.value!.child,
                )
              : Container(),
        ),
        child,
      ],
    );
  }
}
