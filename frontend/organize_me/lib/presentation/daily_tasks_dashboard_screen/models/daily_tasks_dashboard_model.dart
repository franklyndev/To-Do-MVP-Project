import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// Dashboard model used in [daily_tasks_dashboard_screen]

class DailyTasksDashboardModel {
  Rx<String> userName;

  DailyTasksDashboardModel({String? userName})
    : userName = (userName ?? 'fulano').obs;
}
