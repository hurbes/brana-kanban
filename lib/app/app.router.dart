// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:stacked/stacked.dart' as _i11;
import 'package:stacked_services/stacked_services.dart' as _i10;

import '../ui/views/history/history_view.dart' as _i8;
import '../ui/views/home/home_view.dart' as _i1;
import '../ui/views/intro/intro_view.dart' as _i3;
import '../ui/views/kanban/kanban_view.dart' as _i5;
import '../ui/views/parent/parent_view.dart' as _i7;
import '../ui/views/settings/settings_view.dart' as _i4;
import '../ui/views/startup/startup_view.dart' as _i2;
import '../ui/views/task/task_view.dart' as _i6;
import '../ui/views/task_history/task_history_view.dart' as _i9;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i10.StackedService.navigatorKey);

class StackedRouterWeb extends _i11.RootStackRouter {
  StackedRouterWeb({_i12.GlobalKey<_i12.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    StartupViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.StartupView(),
      );
    },
    IntroViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.IntroView(),
      );
    },
    SettingsViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SettingsView(),
      );
    },
    KanbanViewRoute.name: (routeData) {
      final args = routeData.argsAs<KanbanViewArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.KanbanView(
          key: args.key,
          title: args.title,
          id: args.id,
        ),
      );
    },
    TaskViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.TaskView(),
      );
    },
    ParentViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ParentView(),
      );
    },
    HistoryViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.HistoryView(),
      );
    },
    TaskHistoryViewRoute.name: (routeData) {
      final args = routeData.argsAs<TaskHistoryViewArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.TaskHistoryView(
          key: args.key,
          boardId: args.boardId,
          title: args.title,
        ),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i11.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          IntroViewRoute.name,
          path: '/intro-view',
        ),
        _i11.RouteConfig(
          SettingsViewRoute.name,
          path: '/settings-view',
        ),
        _i11.RouteConfig(
          KanbanViewRoute.name,
          path: '/kanban-view',
        ),
        _i11.RouteConfig(
          TaskViewRoute.name,
          path: '/task-view',
        ),
        _i11.RouteConfig(
          ParentViewRoute.name,
          path: '/parent-view',
        ),
        _i11.RouteConfig(
          HistoryViewRoute.name,
          path: '/history-view',
        ),
        _i11.RouteConfig(
          HistoryViewRoute.name,
          path: '/history-view',
        ),
        _i11.RouteConfig(
          TaskHistoryViewRoute.name,
          path: '/task-history-view',
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i11.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i2.StartupView]
class StartupViewRoute extends _i11.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i3.IntroView]
class IntroViewRoute extends _i11.PageRouteInfo<void> {
  const IntroViewRoute()
      : super(
          IntroViewRoute.name,
          path: '/intro-view',
        );

  static const String name = 'IntroView';
}

/// generated route for
/// [_i4.SettingsView]
class SettingsViewRoute extends _i11.PageRouteInfo<void> {
  const SettingsViewRoute()
      : super(
          SettingsViewRoute.name,
          path: '/settings-view',
        );

  static const String name = 'SettingsView';
}

/// generated route for
/// [_i5.KanbanView]
class KanbanViewRoute extends _i11.PageRouteInfo<KanbanViewArgs> {
  KanbanViewRoute({
    _i12.Key? key,
    required String title,
    required int id,
  }) : super(
          KanbanViewRoute.name,
          path: '/kanban-view',
          args: KanbanViewArgs(
            key: key,
            title: title,
            id: id,
          ),
        );

  static const String name = 'KanbanView';
}

class KanbanViewArgs {
  const KanbanViewArgs({
    this.key,
    required this.title,
    required this.id,
  });

  final _i12.Key? key;

  final String title;

  final int id;

  @override
  String toString() {
    return 'KanbanViewArgs{key: $key, title: $title, id: $id}';
  }
}

/// generated route for
/// [_i6.TaskView]
class TaskViewRoute extends _i11.PageRouteInfo<void> {
  const TaskViewRoute()
      : super(
          TaskViewRoute.name,
          path: '/task-view',
        );

  static const String name = 'TaskView';
}

/// generated route for
/// [_i7.ParentView]
class ParentViewRoute extends _i11.PageRouteInfo<void> {
  const ParentViewRoute()
      : super(
          ParentViewRoute.name,
          path: '/parent-view',
        );

  static const String name = 'ParentView';
}

/// generated route for
/// [_i8.HistoryView]
class HistoryViewRoute extends _i11.PageRouteInfo<void> {
  const HistoryViewRoute()
      : super(
          HistoryViewRoute.name,
          path: '/history-view',
        );

  static const String name = 'HistoryView';
}

/// generated route for
/// [_i9.TaskHistoryView]
class TaskHistoryViewRoute extends _i11.PageRouteInfo<TaskHistoryViewArgs> {
  TaskHistoryViewRoute({
    _i12.Key? key,
    required int boardId,
    required String title,
  }) : super(
          TaskHistoryViewRoute.name,
          path: '/task-history-view',
          args: TaskHistoryViewArgs(
            key: key,
            boardId: boardId,
            title: title,
          ),
        );

  static const String name = 'TaskHistoryView';
}

class TaskHistoryViewArgs {
  const TaskHistoryViewArgs({
    this.key,
    required this.boardId,
    required this.title,
  });

  final _i12.Key? key;

  final int boardId;

  final String title;

  @override
  String toString() {
    return 'TaskHistoryViewArgs{key: $key, boardId: $boardId, title: $title}';
  }
}

extension RouterStateExtension on _i10.RouterService {
  Future<dynamic> navigateToHomeView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToStartupView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToIntroView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const IntroViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSettingsView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SettingsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToKanbanView({
    _i12.Key? key,
    required String title,
    required int id,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      KanbanViewRoute(
        key: key,
        title: title,
        id: id,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTaskView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const TaskViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToParentView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ParentViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHistoryView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HistoryViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTaskHistoryView({
    _i12.Key? key,
    required int boardId,
    required String title,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      TaskHistoryViewRoute(
        key: key,
        boardId: boardId,
        title: title,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithIntroView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const IntroViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSettingsView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SettingsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithKanbanView({
    _i12.Key? key,
    required String title,
    required int id,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      KanbanViewRoute(
        key: key,
        title: title,
        id: id,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTaskView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const TaskViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithParentView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ParentViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHistoryView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HistoryViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTaskHistoryView({
    _i12.Key? key,
    required int boardId,
    required String title,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      TaskHistoryViewRoute(
        key: key,
        boardId: boardId,
        title: title,
      ),
      onFailure: onFailure,
    );
  }
}
