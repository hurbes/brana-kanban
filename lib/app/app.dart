import 'package:brana/core/database/repository/task_repository.dart';
import 'package:brana/core/services/date_formater.dart';
import 'package:brana/core/services/shared_preferences_service.dart';
import 'package:brana/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:brana/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:brana/ui/views/home/home_view.dart';
import 'package:brana/ui/views/startup/startup_view.dart';
import 'package:brana/ui/widgets/common/kanban_item/kanban_item_model.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:brana/ui/views/intro/intro_view.dart';
import 'package:brana/ui/bottom_sheets/add_task_board/add_task_board_sheet.dart';
import 'package:brana/ui/views/settings/settings_view.dart';
import 'package:brana/ui/views/kanban/kanban_view.dart';
import 'package:brana/core/services/analytics_service.dart';
import 'package:brana/core/services/notification_service.dart';
import 'package:brana/ui/bottom_sheets/add_task/add_task_sheet.dart';
import 'package:brana/core/services/task_service.dart';
import 'package:brana/ui/bottom_sheets/date_picker/date_picker_sheet.dart';
import 'package:brana/ui/views/parent/parent_view.dart';
import 'package:brana/ui/bottom_sheets/add_comment/add_comment_sheet.dart';
import 'package:brana/ui/views/history/history_view.dart';
import 'package:brana/ui/views/task_history/task_history_view.dart';
import 'package:stacked_themes/stacked_themes.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: IntroView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: KanbanView),
    MaterialRoute(page: ParentView),
    MaterialRoute(page: HistoryView),
    MaterialRoute(page: HistoryView),
    MaterialRoute(page: TaskHistoryView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: AnalyticsService),
    LazySingleton(classType: NotificationService),

// @stacked-service

    InitializableSingleton(classType: SharedPreferencesService),
    InitializableSingleton(classType: TaskRepository),

    LazySingleton(classType: TaskService),
    LazySingleton(classType: DateFormatter),
    LazySingleton(
        classType: ThemeService, resolveUsing: ThemeService.getInstance),

    // @stacked-service-locator

    LazySingleton(classType: KanbanItemModel),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: AddTaskBoardSheet),
    StackedBottomsheet(classType: AddTaskSheet),
    StackedBottomsheet(classType: DatePickerSheet),
    StackedBottomsheet(classType: DatePickerSheet),
    StackedBottomsheet(classType: DatePickerSheet),
    StackedBottomsheet(classType: DatePickerSheet),
    StackedBottomsheet(classType: DatePickerSheet),
    StackedBottomsheet(classType: AddCommentSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
