import 'brana_kanban_parameters.dart';
import 'drag_handle.dart';
import 'measure_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'brana_kanban_item.dart';

class BranaKanbanItemWrapper extends HookWidget {
  final BranaKanbanItem child;
  final BranaKanbanParameters? parameters;

  const BranaKanbanItemWrapper({
    required this.child,
    required this.parameters,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hoveredDraggable = useState<BranaKanbanItem?>(null);
    final dragging = useState<bool>(false);
    final containerSize = useState<Size>(Size.zero);
    final dragHandleSize = useState<Size>(Size.zero);

    final feedbackContainerOffset = useCallback(() {
      double xOffset;
      double yOffset;

      xOffset = parameters!.itemDragHandle!.onLeft
          ? 0
          : -containerSize.value.width + dragHandleSize.value.width;

      yOffset = parameters!.itemDragHandle!.verticalAlignment ==
              DragHandleVerticalAlignment.bottom
          ? -containerSize.value.height + dragHandleSize.value.width
          : 0;

      return Offset(xOffset, yOffset);
    }, [containerSize.value, dragHandleSize.value, parameters]);

    final setDragging = useCallback((bool isDragging) {
      if (dragging.value != isDragging) {
        dragging.value = isDragging;
        parameters!.onItemDraggingChanged?.call(child, isDragging);
      }
    }, [dragging, parameters, child]);

    final onPointerMove = useCallback((PointerMoveEvent event) {
      if (dragging.value) {
        parameters!.onPointerMove?.call(event);
      }
    }, [dragging, parameters]);

    return _KanbanItemContainer(
      parameters: parameters,
      hoveredDraggable: hoveredDraggable,
      setDragging: setDragging,
      feedbackContainerOffset: feedbackContainerOffset,
      dragging: dragging,
      containerSize: containerSize,
      dragHandleSize: dragHandleSize,
      onPointerMove: onPointerMove,
      child: child,
    );
  }
}

class _KanbanItemContainer extends HookWidget {
  final BranaKanbanParameters? parameters;
  final ValueNotifier<BranaKanbanItem?> hoveredDraggable;
  final void Function(bool) setDragging;
  final Offset Function() feedbackContainerOffset;
  final ValueNotifier<bool> dragging;
  final ValueNotifier<Size> containerSize;
  final ValueNotifier<Size> dragHandleSize;
  final void Function(PointerMoveEvent) onPointerMove;
  final BranaKanbanItem child;

  const _KanbanItemContainer({
    required this.parameters,
    required this.hoveredDraggable,
    required this.setDragging,
    required this.feedbackContainerOffset,
    required this.dragging,
    required this.containerSize,
    required this.dragHandleSize,
    required this.onPointerMove,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Widget draggable = _buildDraggable();

    return Stack(
      children: <Widget>[
        _KanbanItemColumn(
          draggable: draggable,
          parameters: parameters,
          onPointerMove: onPointerMove,
          hoveredDraggable: hoveredDraggable,
        ),
        Positioned.fill(
          child: DragTarget<BranaKanbanItem>(
            builder: (context, candidateData, rejectedData) {
              return SizedBox(
                width: containerSize.value.width,
                height: containerSize.value.height,
              );
            },
            onWillAcceptWithDetails: (details) {
              bool accept =
                  parameters!.itemOnWillAccept?.call(details.data, child) ??
                      true;
              if (accept) {
                hoveredDraggable.value = details.data;
              }
              return accept;
            },
            onLeave: (data) {
              hoveredDraggable.value = null;
            },
            onAcceptWithDetails: (details) {
              parameters!.onItemReordered?.call(details.data, child);
              hoveredDraggable.value = null;
            },
          ),
        )
      ],
    );
  }

  Widget _buildDraggable() {
    if (child.canDrag) {
      if (parameters!.itemDragHandle != null) {
        return _buildDraggableWithHandle();
      } else if (parameters!.dragOnLongPress) {
        return _buildDraggableWithLongPress();
      } else {
        return _buildSimpleDraggable();
      }
    } else {
      return AnimatedSize(
        duration: Duration(milliseconds: parameters!.itemSizeAnimationDuration),
        alignment: Alignment.bottomCenter,
        child: hoveredDraggable.value != null ? Container() : child.child,
      );
    }
  }

  Widget _buildDraggableWithHandle() {
    Widget feedback = _DraggableHandle(
      parameters: parameters,
      containerSize: containerSize,
      child: child,
    );

    var positionedDragHandle = _PositionedDragHandle(
      parameters: parameters,
      child: child,
      feedbackContainerOffset: feedbackContainerOffset,
      feedback: feedback,
      setDragging: setDragging,
      dragHandleSize: dragHandleSize,
    );

    return MeasureSize(
      onSizeChange: (size) => containerSize.value = size!,
      child: Stack(
        children: [
          Visibility(
            visible: !dragging.value,
            child: child.child,
          ),
          positionedDragHandle,
        ],
      ),
    );
  }

  Widget _buildDraggableWithLongPress() {
    return _LongPressDraggle(
      containerSize: containerSize,
      child: child,
      parameters: parameters,
      setDragging: setDragging,
    );
  }

  Widget _buildSimpleDraggable() {
    return _SimpleDraggable(
      containerSize: containerSize,
      child: child,
      parameters: parameters,
      setDragging: setDragging,
    );
  }
}

class _DraggableHandle extends StatelessWidget {
  const _DraggableHandle({
    required this.parameters,
    required this.containerSize,
    required this.child,
  });

  final BranaKanbanParameters? parameters;
  final ValueNotifier<Size> containerSize;
  final BranaKanbanItem child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: parameters!.itemDraggingWidth ?? containerSize.value.width,
      child: Stack(
        children: [
          child.child,
          Positioned(
            right: parameters!.itemDragHandle!.onLeft ? null : 0,
            left: parameters!.itemDragHandle!.onLeft ? 0 : null,
            top: parameters!.itemDragHandle!.verticalAlignment ==
                    DragHandleVerticalAlignment.bottom
                ? null
                : 0,
            bottom: parameters!.itemDragHandle!.verticalAlignment ==
                    DragHandleVerticalAlignment.top
                ? null
                : 0,
            child: parameters!.itemDragHandle!,
          ),
        ],
      ),
    );
  }
}

class _KanbanItemColumn extends StatelessWidget {
  const _KanbanItemColumn({
    required this.parameters,
    required this.hoveredDraggable,
    required this.onPointerMove,
    required this.draggable,
  });

  final BranaKanbanParameters? parameters;
  final ValueNotifier<BranaKanbanItem?> hoveredDraggable;
  final void Function(PointerMoveEvent p1) onPointerMove;
  final Widget draggable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: parameters!.verticalAlignment,
      children: <Widget>[
        AnimatedSize(
          duration: Duration(
            milliseconds: parameters!.itemSizeAnimationDuration,
          ),
          alignment: Alignment.topLeft,
          child: hoveredDraggable.value != null
              ? Opacity(
                  opacity: parameters!.itemGhostOpacity,
                  child: parameters!.itemGhost ?? hoveredDraggable.value!.child,
                )
              : Container(),
        ),
        Listener(
          onPointerMove: onPointerMove,
          onPointerDown: parameters!.onPointerDown,
          onPointerUp: parameters!.onPointerUp,
          child: draggable,
        ),
      ],
    );
  }
}

class _LongPressDraggle extends StatelessWidget {
  const _LongPressDraggle({
    required this.containerSize,
    required this.child,
    required this.parameters,
    required this.setDragging,
  });

  final ValueNotifier<Size> containerSize;
  final BranaKanbanItem child;
  final BranaKanbanParameters? parameters;
  final void Function(bool p1) setDragging;

  @override
  Widget build(BuildContext context) {
    return MeasureSize(
      onSizeChange: (size) => containerSize.value = size!,
      child: LongPressDraggable<BranaKanbanItem>(
        delay: const Duration(milliseconds: 150),
        data: child,
        axis: parameters!.axis == Axis.vertical &&
                parameters!.constrainDraggingAxis
            ? Axis.vertical
            : null,
        feedback: SizedBox(
          width: parameters!.itemDraggingWidth ?? containerSize.value.width,
          child: Container(
            decoration: parameters!.itemDecorationWhileDragging,
            child: Directionality(
              textDirection: Directionality.of(context),
              child: child.feedbackWidget ?? child.child,
            ),
          ),
        ),
        childWhenDragging: Container(),
        onDragStarted: () => setDragging(true),
        onDragCompleted: () => setDragging(false),
        onDraggableCanceled: (_, __) => setDragging(false),
        onDragEnd: (_) => setDragging(false),
        child: child.child,
      ),
    );
  }
}

class _SimpleDraggable extends StatelessWidget {
  const _SimpleDraggable({
    required this.containerSize,
    required this.child,
    required this.parameters,
    required this.setDragging,
  });

  final ValueNotifier<Size> containerSize;
  final BranaKanbanItem child;
  final BranaKanbanParameters? parameters;
  final void Function(bool p1) setDragging;

  @override
  Widget build(BuildContext context) {
    return MeasureSize(
      onSizeChange: (size) => containerSize.value = size!,
      child: Draggable<BranaKanbanItem>(
        data: child,
        axis: parameters!.axis == Axis.vertical &&
                parameters!.constrainDraggingAxis
            ? Axis.vertical
            : null,
        feedback: SizedBox(
          width: parameters!.itemDraggingWidth ?? containerSize.value.width,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: parameters!.itemDecorationWhileDragging,
              child: Directionality(
                textDirection: Directionality.of(context),
                child: child.feedbackWidget ?? child.child,
              ),
            ),
          ),
        ),
        childWhenDragging: Container(),
        onDragStarted: () => setDragging(true),
        onDragCompleted: () => setDragging(false),
        onDraggableCanceled: (_, __) => setDragging(false),
        onDragEnd: (_) => setDragging(false),
        child: child.child,
      ),
    );
  }
}

class _PositionedDragHandle extends StatelessWidget {
  const _PositionedDragHandle({
    required this.parameters,
    required this.child,
    required this.feedbackContainerOffset,
    required this.feedback,
    required this.setDragging,
    required this.dragHandleSize,
  });

  final BranaKanbanParameters? parameters;
  final BranaKanbanItem child;
  final Offset Function() feedbackContainerOffset;
  final Widget feedback;
  final void Function(bool p1) setDragging;
  final ValueNotifier<Size> dragHandleSize;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: parameters!.itemDragHandle!.onLeft ? null : 0,
      left: parameters!.itemDragHandle!.onLeft ? 0 : null,
      top: parameters!.itemDragHandle!.verticalAlignment ==
              DragHandleVerticalAlignment.bottom
          ? null
          : 0,
      bottom: parameters!.itemDragHandle!.verticalAlignment ==
              DragHandleVerticalAlignment.top
          ? null
          : 0,
      child: MouseRegion(
        cursor: SystemMouseCursors.grab,
        child: Draggable<BranaKanbanItem>(
          data: child,
          axis: parameters!.axis == Axis.vertical &&
                  parameters!.constrainDraggingAxis
              ? Axis.vertical
              : null,
          feedback: Transform.translate(
            offset: feedbackContainerOffset(),
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: parameters!.itemDecorationWhileDragging,
                child: Directionality(
                  textDirection: Directionality.of(context),
                  child: feedback,
                ),
              ),
            ),
          ),
          childWhenDragging: Container(),
          onDragStarted: () => setDragging(true),
          onDragCompleted: () => setDragging(false),
          onDraggableCanceled: (_, __) => setDragging(false),
          onDragEnd: (_) => setDragging(false),
          child: MeasureSize(
            onSizeChange: (size) => dragHandleSize.value = size!,
            child: parameters!.itemDragHandle,
          ),
        ),
      ),
    );
  }
}
