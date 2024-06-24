import 'dart:async';

import 'package:brana/app/app.locator.dart';
import 'package:brana/core/database/dao/task_boards_dao.dart';
import 'package:brana/core/database/dao/task_comments_dao.dart';
import 'package:brana/core/database/dao/tasks_dao.dart';
import 'package:brana/core/database/db/app_database.dart';
import 'package:brana/core/database/repository/task_repository.dart';
import 'package:brana/core/services/date_formater.dart';
import 'package:brana/core/services/shared_preferences_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:brana/core/services/analytics_service.dart';
import 'package:brana/core/services/notification_service.dart';
import 'package:brana/core/services/task_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<RouterService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AnalyticsService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<NotificationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TaskService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DateFormatter>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SnackbarService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SharedPreferencesService>(
      onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec

  MockSpec<TaskRepository>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TaskDatabase>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TasksDao>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TaskBoardDao>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TaskCommentsDao>(onMissingStub: OnMissingStub.returnDefault),
])
Future<void> registerServices() async {
  getAndRegisterRouterService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterSnackbarService();
  getAndRegisterAnalyticsService();
  await getAndRegisterSharedPreferencesService();

  getAndRegisterNotificationService();

  getAndRegisterDateFormatter();

  getAndRegisterTaskDatabase();
  getAndRegisterTasksDao();
  getAndRegisterTaskCommentsDao();
  getAndRegisterTaskBoardDao();

  await getAndRegisterTaskRepository();

  getAndRegisterTaskService();
// @stacked-mock-register
}

MockRouterService getAndRegisterRouterService() {
  _removeRegistrationIfExists<RouterService>();
  final service = MockRouterService();
  locator.registerSingleton<RouterService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockAnalyticsService getAndRegisterAnalyticsService() {
  _removeRegistrationIfExists<AnalyticsService>();
  final service = MockAnalyticsService();
  locator.registerSingleton<AnalyticsService>(service);
  return service;
}

MockNotificationService getAndRegisterNotificationService() {
  _removeRegistrationIfExists<NotificationService>();
  final service = MockNotificationService();
  locator.registerSingleton<NotificationService>(service);
  return service;
}

MockTaskService getAndRegisterTaskService() {
  _removeRegistrationIfExists<TaskService>();
  final service = MockTaskService();
  locator.registerSingleton<TaskService>(service);
  return service;
}

Future<MockSharedPreferencesService>
    getAndRegisterSharedPreferencesService() async {
  _removeRegistrationIfExists<SharedPreferencesService>();
  final service = MockSharedPreferencesService();
  locator.registerSingleton<SharedPreferencesService>(service);
  await service.init();
  return service;
}

Future<MockTaskRepository> getAndRegisterTaskRepository() async {
  _removeRegistrationIfExists<TaskRepository>();
  final service = MockTaskRepository();
  locator.registerSingleton<TaskRepository>(service);
  await service.init();
  return service;
}

// @stacked-register

MockTaskDatabase getAndRegisterTaskDatabase() {
  _removeRegistrationIfExists<TaskDatabase>();
  final service = MockTaskDatabase();
  locator.registerSingleton<TaskDatabase>(service);
  return service;
}

MockTasksDao getAndRegisterTasksDao() {
  _removeRegistrationIfExists<TasksDao>();
  final service = MockTasksDao();
  locator.registerSingleton<TasksDao>(service);
  return service;
}

MockTaskBoardDao getAndRegisterTaskBoardDao() {
  _removeRegistrationIfExists<TaskBoardDao>();
  final service = MockTaskBoardDao();
  locator.registerSingleton<TaskBoardDao>(service);
  return service;
}

MockTaskCommentsDao getAndRegisterTaskCommentsDao() {
  _removeRegistrationIfExists<TaskCommentsDao>();
  final service = MockTaskCommentsDao();
  locator.registerSingleton<TaskCommentsDao>(service);
  return service;
}

MockDateFormatter getAndRegisterDateFormatter() {
  _removeRegistrationIfExists<DateFormatter>();
  final service = MockDateFormatter();
  locator.registerSingleton<DateFormatter>(service);
  return service;
}

MockSnackbarService getAndRegisterSnackbarService() {
  _removeRegistrationIfExists<SnackbarService>();
  final service = MockSnackbarService();
  locator.registerSingleton<SnackbarService>(service);
  return service;
}

// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
