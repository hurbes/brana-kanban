import 'dart:math';
import 'brana_kanban_board.dart';
import 'brana_kanban_list_target.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'brana_kanban_item.dart';
import 'package:flutter/rendering.dart';
import 'brana_kanban_list_interface.dart';
import 'brana_kanban_target_item.dart';

// Hook for scroll handling
ScrollController useCustomScrollController({
  ScrollController? externalScrollController,
  required Function(PointerDownEvent event) onPointerDown,
  required Function(PointerUpEvent event) onPointerUp,
  required Function(PointerMoveEvent event) onPointerMove,
}) {
  return use(_ScrollControllerHook(
      externalScrollController, onPointerDown, onPointerUp, onPointerMove));
}

class _ScrollControllerHook extends Hook<ScrollController> {
  final ScrollController? externalScrollController;
  final Function(PointerDownEvent event) onPointerDown;
  final Function(PointerUpEvent event) onPointerUp;
  final Function(PointerMoveEvent event) onPointerMove;

  const _ScrollControllerHook(this.externalScrollController, this.onPointerDown,
      this.onPointerUp, this.onPointerMove);

  @override
  _ScrollControllerHookState createState() => _ScrollControllerHookState();
}

class _ScrollControllerHookState
    extends HookState<ScrollController, _ScrollControllerHook> {
  late final ScrollController _scrollController;
  bool _pointerDown = false;
  double? _pointerYPosition;
  double? _pointerXPosition;
  bool _scrolling = false;

  static const _duration = 30;
  static const _scrollAreaSize = 20;
  static const _overDragMin = 5.0;
  static const _overDragMax = 20.0;
  static const _overDragCoefficient = 3.3;

  @override
  void initHook() {
    super.initHook();
    _scrollController = hook.externalScrollController ?? ScrollController();
  }

  Future<void> _scrollList() async {
    if (!_scrolling &&
        _pointerDown &&
        _pointerYPosition != null &&
        _pointerXPosition != null) {
      double? newOffset;
      var rb =
          _scrollController.position.context.storageContext.findRenderObject()!;
      late Size size;
      if (rb is RenderBox) {
        size = rb.size;
      } else if (rb is RenderSliver) {
        size = rb.paintBounds.size;
      }

      var topLeftOffset = _localToGlobal(rb, Offset.zero);
      var bottomRightOffset = _localToGlobal(rb, size.bottomRight(Offset.zero));

      if (_scrollController.position.axis == Axis.vertical) {
        newOffset = _scrollListVertical(topLeftOffset, bottomRightOffset);
      } else {
        var directionality = Directionality.of(
            _scrollController.position.context.storageContext);
        if (directionality == TextDirection.ltr) {
          newOffset =
              _scrollListHorizontalLtr(topLeftOffset, bottomRightOffset);
        } else {
          newOffset =
              _scrollListHorizontalRtl(topLeftOffset, bottomRightOffset);
        }
      }

      if (newOffset != null) {
        _scrolling = true;
        await _scrollController.animateTo(newOffset,
            duration: const Duration(milliseconds: _duration),
            curve: Curves.linear);
        _scrolling = false;
        if (_pointerDown) _scrollList();
      }
    }
  }

  double? _scrollListVertical(Offset topLeftOffset, Offset bottomRightOffset) {
    double top = topLeftOffset.dy;
    double bottom = bottomRightOffset.dy;
    double? newOffset;

    if (_pointerYPosition != null) {
      if (_pointerYPosition! < (top + _scrollAreaSize) &&
          _scrollController.position.pixels >
              _scrollController.position.minScrollExtent) {
        final overDrag =
            max((top + _scrollAreaSize) - _pointerYPosition!, _overDragMax);
        newOffset = max(
            _scrollController.position.minScrollExtent,
            _scrollController.position.pixels -
                overDrag / _overDragCoefficient);
      } else if (_pointerYPosition! > (bottom - _scrollAreaSize) &&
          _scrollController.position.pixels <
              _scrollController.position.maxScrollExtent) {
        final overDrag = max<double>(
            _pointerYPosition! - (bottom - _scrollAreaSize), _overDragMax);
        newOffset = min(
            _scrollController.position.maxScrollExtent,
            _scrollController.position.pixels +
                overDrag / _overDragCoefficient);
      }
    }

    return newOffset;
  }

  double? _scrollListHorizontalLtr(
      Offset topLeftOffset, Offset bottomRightOffset) {
    double left = topLeftOffset.dx;
    double right = bottomRightOffset.dx;
    double? newOffset;

    if (_pointerXPosition != null) {
      if (_pointerXPosition! < (left + _scrollAreaSize) &&
          _scrollController.position.pixels >
              _scrollController.position.minScrollExtent) {
        final overDrag = min(
            (left + _scrollAreaSize) - _pointerXPosition! + _overDragMin,
            _overDragMax);
        newOffset = max(
            _scrollController.position.minScrollExtent,
            _scrollController.position.pixels -
                overDrag / _overDragCoefficient);
      } else if (_pointerXPosition! > (right - _scrollAreaSize) &&
          _scrollController.position.pixels <
              _scrollController.position.maxScrollExtent) {
        final overDrag = min(
            _pointerXPosition! - (right - _scrollAreaSize) + _overDragMin,
            _overDragMax);
        newOffset = min(
            _scrollController.position.maxScrollExtent,
            _scrollController.position.pixels +
                overDrag / _overDragCoefficient);
      }
    }

    return newOffset;
  }

  double? _scrollListHorizontalRtl(
      Offset topLeftOffset, Offset bottomRightOffset) {
    double left = topLeftOffset.dx;
    double right = bottomRightOffset.dx;
    double? newOffset;

    if (_pointerXPosition != null) {
      if (_pointerXPosition! < (left + _scrollAreaSize) &&
          _scrollController.position.pixels <
              _scrollController.position.maxScrollExtent) {
        final overDrag = min(
            (left + _scrollAreaSize) - _pointerXPosition! + _overDragMin,
            _overDragMax);
        newOffset = min(
            _scrollController.position.maxScrollExtent,
            _scrollController.position.pixels +
                overDrag / _overDragCoefficient);
      } else if (_pointerXPosition! > (right - _scrollAreaSize) &&
          _scrollController.position.pixels >
              _scrollController.position.minScrollExtent) {
        final overDrag = min(
            _pointerXPosition! - (right - _scrollAreaSize) + _overDragMin,
            _overDragMax);
        newOffset = max(
            _scrollController.position.minScrollExtent,
            _scrollController.position.pixels -
                overDrag / _overDragCoefficient);
      }
    }

    return newOffset;
  }

  static Offset _localToGlobal(RenderObject object, Offset point,
      {RenderObject? ancestor}) {
    return MatrixUtils.transformPoint(object.getTransformTo(ancestor), point);
  }

  @override
  ScrollController build(BuildContext context) => _scrollController;
}

// Hook for handling reordering logic
_ReorderingLogic useReorderingLogic(
  List<BranaKanbanItemInterface> children,
  Function(OnItemReorderIndex) onItemReorder,
  void Function(int oldListIndex, int newListIndex)? onListReorder,
  void Function(BranaKanbanItem newItem, int listIndex, int newItemIndex)?
      onItemAdd,
  void Function(BranaKanbanItemInterface newList, int newListIndex)? onListAdd,
  void Function(
          BranaKanbanItemInterface incoming, BranaKanbanItemInterface target)?
      listOnAccept,
  void Function(
          BranaKanbanItemInterface incoming, BranaKanbanTargetList target)?
      listTargetOnAccept,
  void Function(BranaKanbanItem incoming, BranaKanbanItem target)? itemOnAccept,
  bool Function(BranaKanbanItem?, BranaKanbanTargetItem)? itemTargetOnAccept,
) {
  return use(_ReorderingLogicHook(
    children,
    onItemReorder,
    onListReorder,
    onItemAdd,
    onListAdd,
    listOnAccept,
    listTargetOnAccept,
    itemOnAccept,
    itemTargetOnAccept,
  ));
}

class _ReorderingLogicHook extends Hook<_ReorderingLogic> {
  final List<BranaKanbanItemInterface> children;
  final void Function(OnItemReorderIndex) onItemReorder;
  final void Function(int oldListIndex, int newListIndex)? onListReorder;
  final void Function(BranaKanbanItem newItem, int listIndex, int newItemIndex)?
      onItemAdd;
  final void Function(BranaKanbanItemInterface newList, int newListIndex)?
      onListAdd;
  final void Function(
          BranaKanbanItemInterface incoming, BranaKanbanItemInterface target)?
      listOnAccept;
  final void Function(
          BranaKanbanItemInterface incoming, BranaKanbanTargetList target)?
      listTargetOnAccept;
  final void Function(BranaKanbanItem incoming, BranaKanbanItem target)?
      itemOnAccept;
  final bool Function(BranaKanbanItem incoming, BranaKanbanTargetItem target)?
      itemTargetOnAccept;

  const _ReorderingLogicHook(
    this.children,
    this.onItemReorder,
    this.onListReorder,
    this.onItemAdd,
    this.onListAdd,
    this.listOnAccept,
    this.listTargetOnAccept,
    this.itemOnAccept,
    this.itemTargetOnAccept,
  );

  @override
  _ReorderingLogicHookState createState() => _ReorderingLogicHookState();
}

class _ReorderingLogicHookState
    extends HookState<_ReorderingLogic, _ReorderingLogicHook>
    implements _ReorderingLogic {
  @override
  void internalOnItemReorder(
      BranaKanbanItem reordered, BranaKanbanItem receiver) {
    if (hook.itemOnAccept != null) {
      hook.itemOnAccept!(reordered, receiver);
    }

    int reorderedListIndex = -1;
    int reorderedItemIndex = -1;
    int receiverListIndex = -1;
    int receiverItemIndex = -1;

    for (int i = 0; i < hook.children.length; i++) {
      if (reorderedItemIndex == -1) {
        reorderedItemIndex =
            hook.children[i].children!.indexWhere((e) => reordered == e);
        if (reorderedItemIndex != -1) reorderedListIndex = i;
      }
      if (receiverItemIndex == -1) {
        receiverItemIndex =
            hook.children[i].children!.indexWhere((e) => receiver == e);
        if (receiverItemIndex != -1) receiverListIndex = i;
      }
      if (reorderedItemIndex != -1 && receiverItemIndex != -1) {
        break;
      }
    }

    if (reorderedItemIndex == -1) {
      if (hook.onItemAdd != null) {
        hook.onItemAdd!(reordered, receiverListIndex, receiverItemIndex);
      }
    } else {
      if (reorderedListIndex == receiverListIndex &&
          receiverItemIndex > reorderedItemIndex) {
        receiverItemIndex--;
      }

      hook.onItemReorder(OnItemReorderIndex(
        oldItemIndex: reorderedItemIndex,
        oldListIndex: reorderedListIndex,
        newItemIndex: receiverItemIndex,
        newListIndex: receiverListIndex,
      ));
    }
  }

  @override
  void internalOnListReorder(
      BranaKanbanItemInterface reordered, BranaKanbanItemInterface receiver) {
    int reorderedListIndex = hook.children.indexWhere((e) => reordered == e);
    int receiverListIndex = hook.children.indexWhere((e) => receiver == e);

    int newListIndex = receiverListIndex;

    if (hook.listOnAccept != null) hook.listOnAccept!(reordered, receiver);

    if (reorderedListIndex == -1) {
      if (hook.onListAdd != null) hook.onListAdd!(reordered, newListIndex);
    } else {
      if (newListIndex > reorderedListIndex) {
        newListIndex--;
      }
      if (hook.onListReorder != null) {
        hook.onListReorder!(reorderedListIndex, newListIndex);
      }
    }
  }

  @override
  void internalOnItemDropOnLastTarget(
    BranaKanbanItem newOrReordered,
    BranaKanbanItemInterface parentList,
    BranaKanbanTargetItem receiver,
  ) {
    if (hook.itemTargetOnAccept != null) {
      hook.itemTargetOnAccept!(newOrReordered, receiver);
    }

    int reorderedListIndex = -1;
    int reorderedItemIndex = -1;
    int receiverListIndex = -1;
    int receiverItemIndex = -1;

    if (hook.children.isNotEmpty) {
      for (int i = 0; i < hook.children.length; i++) {
        if (reorderedItemIndex == -1) {
          reorderedItemIndex = hook.children[i].children
                  ?.indexWhere((e) => newOrReordered == e) ??
              -1;
          if (reorderedItemIndex != -1) reorderedListIndex = i;
        }

        if (receiverItemIndex == -1 && hook.children[i] == parentList) {
          receiverListIndex = i;
          receiverItemIndex = hook.children[i].children?.length ?? -1;
        }

        if (reorderedItemIndex != -1 && receiverItemIndex != -1) {
          break;
        }
      }
    }

    if (reorderedItemIndex == -1) {
      if (hook.onItemAdd != null) {
        hook.onItemAdd!(newOrReordered, receiverListIndex, reorderedItemIndex);
      }
    } else {
      if (reorderedListIndex == receiverListIndex &&
          receiverItemIndex > reorderedItemIndex) {
        receiverItemIndex--;
      }
      hook.onItemReorder(OnItemReorderIndex(
        oldItemIndex: reorderedItemIndex,
        oldListIndex: reorderedListIndex,
        newItemIndex: receiverItemIndex,
        newListIndex: receiverListIndex,
      ));
    }
  }

  @override
  void internalOnListDropOnLastTarget(
    BranaKanbanItemInterface newOrReordered,
    BranaKanbanTargetList receiver,
  ) {
    int reorderedListIndex =
        hook.children.indexWhere((e) => newOrReordered == e);

    if (hook.listOnAccept != null) {
      hook.listTargetOnAccept!(newOrReordered, receiver);
    }

    if (reorderedListIndex >= 0) {
      hook.onListReorder?.call(reorderedListIndex, hook.children.length - 1);
    } else {
      if (hook.onListAdd != null) {
        hook.onListAdd!(newOrReordered, reorderedListIndex);
      }
    }
  }

  @override
  _ReorderingLogic build(BuildContext context) => this;
}

mixin _ReorderingLogic {
  void internalOnItemReorder(
      BranaKanbanItem reordered, BranaKanbanItem receiver);
  void internalOnListReorder(
      BranaKanbanItemInterface reordered, BranaKanbanItemInterface receiver);
  void internalOnItemDropOnLastTarget(BranaKanbanItem newOrReordered,
      BranaKanbanItemInterface parentList, BranaKanbanTargetItem receiver);
  void internalOnListDropOnLastTarget(
      BranaKanbanItemInterface newOrReordered, BranaKanbanTargetList receiver);
}
