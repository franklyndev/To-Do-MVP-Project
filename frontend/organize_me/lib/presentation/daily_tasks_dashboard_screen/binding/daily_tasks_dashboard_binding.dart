import 'package:get/get.dart';
import '../controller/daily_tasks_dashboard_controller.dart';
import '../../../core/app_export.dart';

class DailyTasksDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyTasksDashboardController>(
      () => DailyTasksDashboardController(),
    );
  }
}
