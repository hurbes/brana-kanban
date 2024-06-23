import 'brana_kanban_parameters.dart';
import 'brana_kanban_interface.dart';
import 'brana_kanban_item.dart';
import 'package:flutter/material.dart';

abstract class BranaKanbanItemInterface implements BranaKanbanInterface {
  List<BranaKanbanItem>? get children;

  /// Whether or not this item can be dragged.
  /// Set to true if it can be reordered.
  /// Set to false if it must remain fixed.
  bool get canDrag;
  Widget generateWidget(BranaKanbanParameters params);
}

abstract class BranaKanbanItemExpansionInterface
    implements BranaKanbanItemInterface {
  @override
  final List<BranaKanbanItem>? children;

  BranaKanbanItemExpansionInterface({this.children});

  get isExpanded;

  toggleExpanded();

  expand();

  collapse();
}
