import 'brana_kanban_parameters.dart';
import 'brana_kanban_item.dart';
import 'brana_kanban_target_item.dart';
import 'brana_kanban_wrapper.dart';
import 'brana_kanban_list_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BranaKanbanList implements BranaKanbanItemInterface {
  final Widget? header;

  final Widget? footer;

  final Widget? leftSide;

  final Widget? rightSide;

  final Widget? contentsWhenEmpty;

  final Widget? lastTarget;

  final Decoration? decoration;

  final CrossAxisAlignment verticalAlignment;

  final MainAxisAlignment horizontalAlignment;

  @override
  final List<BranaKanbanItem> children;

  @override
  final bool canDrag;
  final Key? key;

  BranaKanbanList({
    required this.children,
    this.key,
    this.header,
    this.footer,
    this.leftSide,
    this.rightSide,
    this.contentsWhenEmpty,
    this.lastTarget,
    this.decoration,
    this.horizontalAlignment = MainAxisAlignment.start,
    this.verticalAlignment = CrossAxisAlignment.start,
    this.canDrag = true,
  });

  @override
  Widget generateWidget(BranaKanbanParameters params) {
    var contents = <Widget>[];
    if (header != null) {
      contents.add(Flexible(child: header!));
    }

    Widget intrinsicHeight = IntrinsicHeight(
      child: Row(
        mainAxisAlignment: horizontalAlignment,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _generateDragAndDropListInnerContents(params),
      ),
    );
    if (params.axis == Axis.horizontal) {
      intrinsicHeight = SizedBox(
        width: params.listWidth,
        child: intrinsicHeight,
      );
    }
    if (params.listInnerDecoration != null) {
      intrinsicHeight = Container(
        decoration: params.listInnerDecoration,
        child: intrinsicHeight,
      );
    }
    contents.add(intrinsicHeight);

    if (footer != null) {
      contents.add(Flexible(child: footer!));
    }

    return Container(
      key: key,
      width: params.axis == Axis.vertical
          ? double.infinity
          : params.listWidth - params.listPadding!.horizontal,
      decoration: decoration ?? params.listDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: verticalAlignment,
        children: contents,
      ),
    );
  }

  List<Widget> _generateDragAndDropListInnerContents(
    BranaKanbanParameters parameters,
  ) {
    var contents = <Widget>[];
    if (leftSide != null) {
      contents.add(leftSide!);
    }
    if (children.isNotEmpty) {
      List<Widget> allChildren = <Widget>[];
      if (parameters.addLastItemTargetHeightToTop) {
        allChildren.add(Padding(
          padding: EdgeInsets.only(top: parameters.lastItemTargetHeight),
        ));
      }
      for (int i = 0; i < children.length; i++) {
        allChildren.add(BranaKanbanItemWrapper(
          key: children[i].key,
          child: children[i],
          parameters: parameters,
        ));
        if (parameters.itemDivider != null && i < children.length - 1) {
          allChildren.add(parameters.itemDivider!);
        }
      }
      allChildren.add(
        BranaKanbanTargetItem(
          parent: this,
          parameters: parameters,
          onReorderOrAdd: parameters.onItemDropOnLastTarget!,
          child: lastTarget ??
              Container(
                height: parameters.lastItemTargetHeight,
              ),
        ),
      );
      contents.add(
        Expanded(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: verticalAlignment,
              mainAxisSize: MainAxisSize.max,
              children: allChildren,
            ),
          ),
        ),
      );
    } else {
      contents.add(
        Expanded(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // contentsWhenEmpty ??
                //     const Text(
                //       'Empty list',
                //       style: TextStyle(
                //         fontStyle: FontStyle.italic,
                //       ),
                //     ),
                BranaKanbanTargetItem(
                  parent: this,
                  parameters: parameters,
                  onReorderOrAdd: parameters.onItemDropOnLastTarget!,
                  child: lastTarget ??
                      Container(
                        height: parameters.lastItemTargetHeight,
                      ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (rightSide != null) {
      contents.add(rightSide!);
    }
    return contents;
  }
}
