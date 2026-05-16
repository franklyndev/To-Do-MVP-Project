import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/daily_tasks_dashboard_model.dart';
import '../models/task_model.dart';

class DailyTasksDashboardController extends GetxController {
  final dashboardModel = Rx<DailyTasksDashboardModel?>(null);
  final currentDateString = ''.obs;
  final completedTasks = <TaskModel>[].obs;
  final pendingTasks = <TaskModel>[].obs;
  final completedTasksCount = 0.obs;
  final totalTasksCount = 0.obs;

  final addTaskController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    dashboardModel.value = DailyTasksDashboardModel(userName: 'fulano');
    _setCurrentDate();
    _loadInitialTasks();
  }

  @override
  void onClose() {
    addTaskController.dispose();
    super.onClose();
  }

  void _setCurrentDate() {
    final now = DateTime.now();
    final weekdays = [
      'Segunda',
      'Terça',
      'Quarta',
      'Quinta',
      'Sexta',
      'Sábado',
      'Domingo',
    ];
    final months = [
      'janeiro',
      'fevereiro',
      'março',
      'abril',
      'maio',
      'junho',
      'julho',
      'agosto',
      'setembro',
      'outubro',
      'novembro',
      'dezembro',
    ];
    final weekday = weekdays[now.weekday - 1];
    final month = months[now.month - 1];
    currentDateString.value = '$weekday, ${now.day} de $month';
  }

  void _loadInitialTasks() {
    completedTasks.assignAll([
      TaskModel(id: '1', title: 'Estudar flutter', isCompleted: true),
      TaskModel(id: '2', title: 'Limpar o quarto', isCompleted: true),
    ]);
    pendingTasks.assignAll([]);
    _updateCounts();
  }

  void _updateCounts() {
    completedTasksCount.value = completedTasks.length;
    totalTasksCount.value = completedTasks.length + pendingTasks.length;
  }

  void toggleTaskStatus(TaskModel task) {
    if (task.isCompleted.value) {
      completedTasks.remove(task);
      task.isCompleted.value = false;
      pendingTasks.add(task);
    } else {
      pendingTasks.remove(task);
      task.isCompleted.value = true;
      completedTasks.add(task);
    }
    _updateCounts();
  }

  void onAddTaskTapped(BuildContext context) {
    _showAddTaskDialog(context);
  }

  void _showAddTaskDialog(BuildContext context) {
    addTaskController.clear();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: appTheme.blue_gray_800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Adicionar Tarefa',
          style: TextStyleHelper.instance.bodyTextBoldInter,
        ),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: addTaskController,
            style: TextStyleHelper.instance.textStyle6,
            decoration: InputDecoration(
              hintText: 'Nome da tarefa',
              hintStyle: TextStyleHelper.instance.textStyle6.copyWith(
                color: appTheme.indigo_300_01,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: appTheme.indigo_300_01, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: appTheme.blue_100, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: appTheme.colorFFFF52, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: appTheme.colorFFFF52, width: 1.5),
              ),
            ),
            validator: _validateTaskTitle,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancelar',
              style: TextStyleHelper.instance.textStyle6.copyWith(
                color: appTheme.indigo_300_01,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: appTheme.indigo_300_01,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => _submitAddTask(ctx),
            child: Text(
              'Adicionar',
              style: TextStyleHelper.instance.textStyle6,
            ),
          ),
        ],
      ),
    );
  }

  String? _validateTaskTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, insira o nome da tarefa';
    }
    if (value.trim().length < 2) {
      return 'O nome deve ter pelo menos 2 caracteres';
    }
    return null;
  }

  void _submitAddTask(BuildContext ctx) {
    if (formKey.currentState?.validate() ?? false) {
      final newTask = TaskModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: addTaskController.text.trim(),
        isCompleted: false,
      );
      pendingTasks.add(newTask);
      _updateCounts();
      addTaskController.clear();
      Get.back();
    }
  }
}
