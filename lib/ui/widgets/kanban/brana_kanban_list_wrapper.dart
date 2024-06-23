import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'brana_kanban_parameters.dart';
import 'brana_kanban_list_interface.dart';

class BranaKanbanListWrapper extends HookWidget {
  final BranaKanbanItemInterface dragAndDropList;
  final BranaKanbanParameters parameters;

  const BranaKanbanListWrapper({
    required this.dragAndDropList,
    required this.parameters,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dragging = useState(false);
    final containerSize = useState(Size.zero);
    final dragHandleSize = useState(Size.zero);
    final hoveredDraggable = useState<BranaKanbanItemInterface?>(null);

    return _KanbanContentStack(
      parameters: parameters,
      dragAndDropList: dragAndDropList,
      hoveredDraggable: hoveredDraggable,
      dragging: dragging,
      containerSize: containerSize,
      dragHandleSize: dragHandleSize,
    );
  }
}

class _KanbanContentStack extends StatelessWidget {
  final BranaKanbanParameters parameters;
  final BranaKanbanItemInterface dragAndDropList;
  final ValueNotifier<BranaKanbanItemInterface?> hoveredDraggable;
  final ValueNotifier<bool> dragging;
  final ValueNotifier<Size> containerSize;
  final ValueNotifier<Size> dragHandleSize;

  const _KanbanContentStack({
    required this.parameters,
    required this.dragAndDropList,
    required this.hoveredDraggable,
    required this.dragging,
    required this.containerSize,
    required this.dragHandleSize,
  });

  @override
  Widget build(BuildContext context) {
    Widget draggable = _DraggableWidget(
      dragAndDropList: dragAndDropList,
      parameters: parameters,
      containerSize: containerSize,
      dragging: dragging,
      dragHandleSize: dragHandleSize,
    );

    Widget stack = Stack(
      children: <Widget>[
        Align(alignment: Alignment.center, child: draggable),
        Positioned.fill(
          child: _DragTargetWidget(
            dragAndDropList: dragAndDropList,
            parameters: parameters,
            hoveredDraggable: hoveredDraggable,
          ),
        ),
      ],
    );

    return applyPaddingAndScrolling(stack, parameters);
  }

  Widget applyPaddingAndScrolling(
      Widget child, BranaKanbanParameters parameters) {
    if (parameters.listPadding != null) {
      child = Padding(padding: parameters.listPadding!, child: child);
    }
    if (parameters.axis == Axis.horizontal && !parameters.disableScrolling) {
      child = SingleChildScrollView(child: child);
    }
    return child;
  }
}

class _DraggableWidget extends StatelessWidget {
  final BranaKanbanItemInterface dragAndDropList;
  final BranaKanbanParameters parameters;
  final ValueNotifier<Size> containerSize;
  final ValueNotifier<bool> dragging;
  final ValueNotifier<Size> dragHandleSize;

  const _DraggableWidget({
    required this.dragAndDropList,
    required this.parameters,
    required this.containerSize,
    required this.dragging,
    required this.dragHandleSize,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = dragAndDropList.generateWidget(parameters);
    return content;
    // return Draggable<BranaKanbanItemInterface>(
    //   data: dragAndDropList,
    //   axis: parameters.constrainDraggingAxis ? Axis.vertical : null,
    //   feedback: _buildFeedback(content, context),
    //   childWhenDragging: const SizedBox.shrink(),
    //   onDragStarted: () => dragging.value = true,
    //   onDragEnd: (_) => dragging.value = false,
    //   child: content,
    // );
  }

  // Widget _buildFeedback(Widget content, BuildContext context) {
  //   final width =
  //       parameters.listDraggingWidth ?? MediaQuery.of(context).size.width;
  //   return Material(
  //     color: Colors.transparent,
  //     child: Container(
  //       decoration: parameters.listDecorationWhileDragging,
  //       child: SizedBox(width: width, child: content),
  //     ),
  //   );
  // }
}

class _DragTargetWidget extends StatelessWidget {
  final BranaKanbanItemInterface dragAndDropList;
  final BranaKanbanParameters parameters;
  final ValueNotifier<BranaKanbanItemInterface?> hoveredDraggable;

  const _DragTargetWidget({
    required this.dragAndDropList,
    required this.parameters,
    required this.hoveredDraggable,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<BranaKanbanItemInterface>(
      builder: (context, candidateData, rejectedData) {
        return Container();
      },
      onWillAcceptWithDetails: (details) {
        bool accept = parameters.listOnWillAccept != null
            ? parameters.listOnWillAccept!(details.data, dragAndDropList)
            : true;
        if (accept) hoveredDraggable.value = details.data;
        return accept;
      },
      onLeave: (_) => hoveredDraggable.value = null,
      onAcceptWithDetails: (details) {
        parameters.onListReordered!(details.data, dragAndDropList);
        hoveredDraggable.value = null;
      },
    );
  }
}
