// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/router_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../core/database/repository/task_repository.dart';
import '../core/services/analytics_service.dart';
import '../core/services/brana_app_theme_service.dart';
import '../core/services/date_formater.dart';
import '../core/services/device_local_service.dart';
import '../core/services/notification_service.dart';
import '../core/services/shared_preferences_service.dart';
import '../core/services/task_service.dart';
import '../ui/widgets/common/kanban_item/kanban_item_model.dart';
import 'app.router.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
  StackedRouterWeb? stackedRouter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => RouterService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => AnalyticsService());
  locator.registerLazySingleton(() => NotificationService());
  final sharedPreferencesService = SharedPreferencesService();
  await sharedPreferencesService.init();
  locator.registerSingleton(sharedPreferencesService);

  final taskRepository = TaskRepository();
  await taskRepository.init();
  locator.registerSingleton(taskRepository);

  final branaAppThemeService = BranaAppThemeService();
  await branaAppThemeService.init();
  locator.registerSingleton(branaAppThemeService);

  locator.registerLazySingleton(() => TaskService());
  locator.registerLazySingleton(() => DateFormatter());
  locator.registerLazySingleton(() => DeviceLocalService());
  locator.registerLazySingleton(() => KanbanItemModel());
  if (stackedRouter == null) {
    throw Exception(
        'Stacked is building to use the Router (Navigator 2.0) navigation but no stackedRouter is supplied. Pass the stackedRouter to the setupLocator function in main.dart');
  }

  locator<RouterService>().setRouter(stackedRouter);
}
