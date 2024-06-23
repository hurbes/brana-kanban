import 'brana_kanban_parameters.dart';
import 'brana_kanban_list_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef OnDropOnLastTarget = void Function(
  BranaKanbanItemInterface newOrReordered,
  BranaKanbanTargetList receiver,
);

class BranaKanbanTargetList extends HookWidget {
  final Widget? child;
  final BranaKanbanParameters parameters;
  final OnDropOnLastTarget onDropOnLastTarget;
  final double lastListTargetSize;

  const BranaKanbanTargetList({
    this.child,
    required this.parameters,
    required this.onDropOnLastTarget,
    this.lastListTargetSize = 110,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hoveredDraggable = useState<BranaKanbanItemInterface?>(null);

    return Stack(
      children: <Widget>[
        _DraggleWidget(
          parameters: parameters,
          hoveredDraggable: hoveredDraggable,
          lastListTargetSize: lastListTargetSize,
          child: child,
        ),
        Positioned.fill(
          child: DragTarget<BranaKanbanItemInterface>(
            builder: (context, candidateData, rejectedData) {
              if (candidateData.isNotEmpty) {}
              return Container();
            },
            onWillAcceptWithDetails: (details) {
              bool accept = true;
              if (parameters.listTargetOnWillAccept != null) {
                accept = parameters.listTargetOnWillAccept!(details.data, this);
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
              onDropOnLastTarget(details.data, this);
              hoveredDraggable.value = null;
            },
          ),
        ),
      ],
    );
  }
}

class _DraggleWidget extends StatelessWidget {
  const _DraggleWidget({
    this.child,
    required this.parameters,
    required this.hoveredDraggable,
    required this.lastListTargetSize,
  });

  final BranaKanbanParameters parameters;
  final ValueNotifier<BranaKanbanItemInterface?> hoveredDraggable;
  final Widget? child;
  final double lastListTargetSize;

  @override
  Widget build(BuildContext context) {
    final visibleWidget = _VerticalVisibleContent(
      parameters: parameters,
      hoveredDraggable: hoveredDraggable,
      lastListTargetSize: lastListTargetSize,
      child: child,
    );
    if (parameters.listPadding != null) {
      return Padding(
        padding: parameters.listPadding!,
        child: visibleWidget,
      );
    }
    if (parameters.axis == Axis.horizontal) {
      return SingleChildScrollView(child: visibleWidget);
    }

    return visibleWidget;
  }
}

class _VerticalVisibleContent extends StatelessWidget {
  const _VerticalVisibleContent({
    this.child,
    required this.parameters,
    required this.hoveredDraggable,
    required this.lastListTargetSize,
  });

  final BranaKanbanParameters parameters;
  final ValueNotifier<BranaKanbanItemInterface?> hoveredDraggable;
  final Widget? child;
  final double lastListTargetSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildAnimatedSize(),
        buildChildOrSizedBox(),
      ],
    );
  }

  Widget buildAnimatedSize() {
    return AnimatedSize(
      duration: Duration(milliseconds: parameters.listSizeAnimationDuration),
      alignment: Alignment.bottomCenter,
      child: hoveredDraggable.value != null ? buildGhostWidget() : Container(),
    );
  }

  Widget buildGhostWidget() {
    return Opacity(
      opacity: parameters.listGhostOpacity,
      child: parameters.listGhost ??
          hoveredDraggable.value!.generateWidget(parameters),
    );
  }

  Widget buildChildOrSizedBox() {
    return child ??
        SizedBox(
          height: parameters.axis == Axis.vertical ? lastListTargetSize : null,
          width: parameters.axis == Axis.horizontal ? lastListTargetSize : null,
        );
  }
}
