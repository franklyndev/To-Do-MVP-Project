import 'package:organize_me/presentation/tela_login.dart';

import '../core/app_export.dart';
import 'package:get/get.dart';
import '../presentation/create_account_screen/create_account_screen.dart';
import '../presentation/daily_tasks_dashboard_screen/daily_tasks_dashboard_screen.dart';

import '../presentation/create_account_screen/binding/create_account_binding.dart';
import '../presentation/daily_tasks_dashboard_screen/binding/daily_tasks_dashboard_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String createAccountScreen = '/create_account_screen';
  static const String dailyTasksDashboardScreen =
      '/daily_tasks_dashboard_screen';

  static const String loginScreen = '/tela_login';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = loginScreen;

  static List<GetPage> pages = [
    GetPage(
      name: createAccountScreen,
      page: () => CreateAccountScreen(),
      bindings: [CreateAccountBinding()],
    ),
    GetPage(
      name: dailyTasksDashboardScreen,
      page: () => DailyTasksDashboardScreen(),
      bindings: [DailyTasksDashboardBinding()],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [AppNavigationBinding()],
    ),
    GetPage(name: loginScreen, page: () => const TelaLogin()),
  ];
}
