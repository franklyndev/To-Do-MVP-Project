import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// Task model used in [daily_tasks_dashboard_screen]

class TaskModel {
  Rx<String> title;
  Rx<bool> isCompleted;
  Rx<String> id;

  TaskModel({String? title, bool? isCompleted, String? id})
    : title = (title ?? '').obs,
      isCompleted = (isCompleted ?? false).obs,
      id = (id ?? '').obs;
}
