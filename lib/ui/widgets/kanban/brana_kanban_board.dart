import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'brana_kanban_item.dart';
import 'brana_kanban_hooks.dart';
import 'brana_kanban_parameters.dart';
import 'brana_kanban_target_item.dart';
import 'brana_kanban_list_interface.dart';
import 'brana_kanban_list_target.dart';
import 'brana_kanban_list_wrapper.dart';
import 'drag_handle.dart';

class OnItemReorderIndex {
  final int oldItemIndex;
  final int oldListIndex;
  final int newItemIndex;
  final int newListIndex;

  const OnItemReorderIndex({
    required this.oldItemIndex,
    required this.oldListIndex,
    required this.newItemIndex,
    required this.newListIndex,
  });
}

typedef OnItemReorder = void Function(OnItemReorderIndex);
typedef OnItemAdd = void Function(
  BranaKanbanItem newItem,
  int listIndex,
  int newItemIndex,
);
typedef OnListAdd = void Function(
    BranaKanbanItemInterface newList, int newListIndex);
typedef OnListReorder = void Function(int oldListIndex, int newListIndex);
typedef OnListDraggingChanged = void Function(
  BranaKanbanItemInterface? list,
  bool dragging,
);
typedef ListOnWillAccept = bool Function(
  BranaKanbanItemInterface? incoming,
  BranaKanbanItemInterface? target,
);
typedef ListOnAccept = void Function(
  BranaKanbanItemInterface incoming,
  BranaKanbanItemInterface target,
);
typedef ListTargetOnWillAccept = bool Function(
    BranaKanbanItemInterface? incoming, BranaKanbanTargetList target);
typedef ListTargetOnAccept = void Function(
    BranaKanbanItemInterface incoming, BranaKanbanTargetList target);
typedef OnItemDraggingChanged = void Function(
  BranaKanbanItem item,
  bool dragging,
);
typedef ItemOnWillAccept = bool Function(
  BranaKanbanItem? incoming,
  BranaKanbanItem target,
);
typedef ItemOnAccept = void Function(
  BranaKanbanItem incoming,
  BranaKanbanItem target,
);
typedef ItemTargetOnWillAccept = bool Function(
    BranaKanbanItem? incoming, BranaKanbanTargetItem target);
typedef ItemTargetOnAccept = void Function(
  BranaKanbanItem incoming,
  BranaKanbanItemInterface parentList,
  BranaKanbanTargetItem target,
);

class BranaKanbanBoard extends HookWidget {
  final List<BranaKanbanItemInterface> children;
  final OnItemReorder onItemReorder;
  final OnListReorder? onListReorder;
  final OnItemAdd? onItemAdd;
  final OnListAdd? onListAdd;
  final ListOnWillAccept? listOnWillAccept;
  final ListOnAccept? listOnAccept;
  final ListTargetOnWillAccept? listTargetOnWillAccept;
  final ListTargetOnAccept? listTargetOnAccept;
  final OnListDraggingChanged? onListDraggingChanged;
  final ItemOnWillAccept? itemOnWillAccept;
  final ItemOnAccept? itemOnAccept;
  final ItemTargetOnWillAccept? itemTargetOnAccept;
  final OnItemDraggingChanged? onItemDraggingChanged;
  final double? itemDraggingWidth;
  final Widget? itemGhost;
  final double itemGhostOpacity;
  final int itemSizeAnimationDurationMilliseconds;
  final bool itemDragOnLongPress;
  final Decoration? itemDecorationWhileDragging;
  final Widget? itemDivider;
  final double? listDraggingWidth;
  final Widget? listTarget;
  final Widget? listGhost;
  final double listGhostOpacity;
  final int listSizeAnimationDurationMilliseconds;
  final bool listDragOnLongPress;
  final Decoration? listDecoration;
  final Decoration? listDecorationWhileDragging;
  final Decoration? listInnerDecoration;
  final Widget? listDivider;
  final bool listDividerOnLastChild;
  final EdgeInsets? listPadding;
  final Widget? contentsWhenEmpty;
  final double listWidth;
  final double lastItemTargetHeight;
  final bool addLastItemTargetHeightToTop;
  final double lastListTargetSize;
  final CrossAxisAlignment verticalAlignment;
  final MainAxisAlignment horizontalAlignment;
  final Axis axis;
  final bool disableScrolling;
  final DragHandle? listDragHandle;
  final DragHandle? itemDragHandle;
  final bool constrainDraggingAxis;
  final bool removeTopPadding;
  final ScrollController? scrollController;

  const BranaKanbanBoard({
    required this.children,
    required this.onItemReorder,
    this.onListReorder,
    this.onItemAdd,
    this.onListAdd,
    this.onListDraggingChanged,
    this.listOnWillAccept,
    this.listOnAccept,
    this.listTargetOnWillAccept,
    this.listTargetOnAccept,
    this.onItemDraggingChanged,
    this.itemOnWillAccept,
    this.itemOnAccept,
    this.itemTargetOnAccept,
    this.itemDraggingWidth,
    this.itemGhost,
    this.itemGhostOpacity = 0.3,
    this.itemSizeAnimationDurationMilliseconds = 150,
    this.itemDragOnLongPress = true,
    this.itemDecorationWhileDragging,
    this.itemDivider,
    this.listDraggingWidth,
    this.listTarget,
    this.listGhost,
    this.listGhostOpacity = 0.3,
    this.listSizeAnimationDurationMilliseconds = 150,
    this.listDragOnLongPress = true,
    this.listDecoration,
    this.listDecorationWhileDragging,
    this.listInnerDecoration,
    this.listDivider,
    this.listDividerOnLastChild = true,
    this.listPadding,
    this.contentsWhenEmpty,
    this.listWidth = double.infinity,
    this.lastItemTargetHeight = 20,
    this.addLastItemTargetHeightToTop = false,
    this.lastListTargetSize = 110,
    this.verticalAlignment = CrossAxisAlignment.start,
    this.horizontalAlignment = MainAxisAlignment.start,
    this.axis = Axis.vertical,
    this.disableScrolling = false,
    this.listDragHandle,
    this.itemDragHandle,
    this.constrainDraggingAxis = true,
    this.removeTopPadding = false,
    this.scrollController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useCustomScrollController(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      onPointerMove: _onPointerMove,
    );
    final reorderingLogic = useReorderingLogic(
      children,
      onItemReorder,
      onListReorder,
      onItemAdd,
      onListAdd,
      listOnAccept,
      listTargetOnAccept,
      itemOnAccept,
      itemTargetOnAccept,
    );

    var parameters = BranaKanbanParameters(
      listGhost: listGhost,
      listGhostOpacity: listGhostOpacity,
      listDraggingWidth: listDraggingWidth,
      itemDraggingWidth: itemDraggingWidth,
      listSizeAnimationDuration: listSizeAnimationDurationMilliseconds,
      dragOnLongPress: listDragOnLongPress,
      listPadding: listPadding,
      itemSizeAnimationDuration: itemSizeAnimationDurationMilliseconds,
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      onPointerMove: _onPointerMove,
      onItemReordered: reorderingLogic.internalOnItemReorder,
      onItemDropOnLastTarget: reorderingLogic.internalOnItemDropOnLastTarget,
      onListReordered: reorderingLogic.internalOnListReorder,
      onItemDraggingChanged: onItemDraggingChanged,
      onListDraggingChanged: onListDraggingChanged,
      listOnWillAccept: listOnWillAccept,
      listTargetOnWillAccept: listTargetOnWillAccept,
      itemOnWillAccept: itemOnWillAccept,
      itemGhostOpacity: itemGhostOpacity,
      itemDivider: itemDivider,
      itemDecorationWhileDragging: itemDecorationWhileDragging,
      verticalAlignment: verticalAlignment,
      axis: axis,
      itemGhost: itemGhost,
      listDecoration: listDecoration,
      listDecorationWhileDragging: listDecorationWhileDragging,
      listInnerDecoration: listInnerDecoration,
      listWidth: listWidth,
      lastItemTargetHeight: lastItemTargetHeight,
      addLastItemTargetHeightToTop: addLastItemTargetHeightToTop,
      listDragHandle: listDragHandle,
      itemDragHandle: itemDragHandle,
      constrainDraggingAxis: constrainDraggingAxis,
      disableScrolling: disableScrolling,
    );

    BranaKanbanTargetList dragAndDropListTarget = BranaKanbanTargetList(
      parameters: parameters,
      onDropOnLastTarget: reorderingLogic.internalOnListDropOnLastTarget,
      lastListTargetSize: lastListTargetSize,
      child: listTarget,
    );

    if (children.isNotEmpty) {
      Widget outerListHolder;

      if (disableScrolling) {
        outerListHolder =
            _buildUnscrollableList(dragAndDropListTarget, parameters);
      } else {
        outerListHolder = _buildListView(
            parameters, dragAndDropListTarget, scrollController, context);
      }

      if (children.whereType<BranaKanbanItemExpansionInterface>().isNotEmpty) {
        outerListHolder = PageStorage(
          bucket: PageStorageBucket(),
          child: outerListHolder,
        );
      }
      return outerListHolder;
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          contentsWhenEmpty ?? const Text('Empty'),
          dragAndDropListTarget,
        ],
      );
    }
  }

  void _onPointerMove(PointerMoveEvent event) {
    // Logic for pointer move
  }

  void _onPointerDown(PointerDownEvent event) {
    // Logic for pointer down
  }

  void _onPointerUp(PointerUpEvent event) {
    // Logic for pointer up
  }

  Widget _buildUnscrollableList(BranaKanbanTargetList dragAndDropListTarget,
      BranaKanbanParameters parameters) {
    if (axis == Axis.vertical) {
      return Column(
        children: _buildOuterList(dragAndDropListTarget, parameters),
      );
    } else {
      return Row(
        children: _buildOuterList(dragAndDropListTarget, parameters),
      );
    }
  }

  Widget _buildListView(
    BranaKanbanParameters parameters,
    BranaKanbanTargetList dragAndDropListTarget,
    ScrollController controller,
    BuildContext context,
  ) {
    Widget listView = ListView(
      scrollDirection: axis,
      controller: controller,
      children: _buildOuterList(dragAndDropListTarget, parameters),
    );

    return removeTopPadding
        ? MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: listView,
          )
        : listView;
  }

  List<Widget> _buildOuterList(BranaKanbanTargetList dragAndDropListTarget,
      BranaKanbanParameters parameters) {
    bool includeSeparators = listDivider != null;
    int childrenCount = _calculateChildrenCount(includeSeparators);

    return List.generate(childrenCount, (index) {
      return _buildInnerList(index, childrenCount, dragAndDropListTarget,
          includeSeparators, parameters);
    });
  }

  int _calculateChildrenCount(bool includeSeparators) {
    if (includeSeparators) {
      return (children.length * 2) - (listDividerOnLastChild ? 0 : 1) + 1;
    } else {
      return children.length + 1;
    }
  }

  Widget _buildInnerList(
    int index,
    int childrenCount,
    BranaKanbanTargetList dragAndDropListTarget,
    bool includeSeparators,
    BranaKanbanParameters parameters,
  ) {
    if (index == childrenCount - 1) {
      return dragAndDropListTarget;
    } else if (includeSeparators && index.isOdd) {
      return listDivider!;
    } else {
      return BranaKanbanListWrapper(
        dragAndDropList:
            children[(includeSeparators ? index / 2 : index).toInt()],
        parameters: parameters,
      );
    }
  }
}
