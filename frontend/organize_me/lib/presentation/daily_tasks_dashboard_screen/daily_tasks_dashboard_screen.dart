import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import './controller/daily_tasks_dashboard_controller.dart';
import './widgets/task_item_widget.dart';

class DailyTasksDashboardScreen
    extends GetWidget<DailyTasksDashboardController> {
  DailyTasksDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildProgressCard(),
                  _buildTasksSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 44.h, left: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Text(
              controller.currentDateString.value,
              style: TextStyleHelper.instance.title20BoldInter.copyWith(
                color: appTheme.indigo_300_01,
                height: 1.25,
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Obx(
            () => Text(
              'Olá, ${controller.dashboardModel.value?.userName.value ?? 'fulano'}',
              style: TextStyleHelper.instance.display36BoldInter.copyWith(
                height: 1.22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      margin: EdgeInsets.only(top: 12.h, right: 30.h, left: 30.h),
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 22.h),
      decoration: BoxDecoration(
        color: appTheme.blue_gray_800,
        borderRadius: BorderRadius.circular(20.h),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Progresso de hoje',
            style: TextStyleHelper.instance.title20BoldInter.copyWith(
              color: appTheme.indigo_300_01,
              height: 1.25,
            ),
          ),
          Obx(
            () => Text(
              '${controller.completedTasksCount.value} de ${controller.totalTasksCount.value} tarefas',
              style: TextStyleHelper.instance.headline32RegularInter.copyWith(
                height: 1.22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksSection() {
    return Container(
      margin: EdgeInsets.only(top: 38.h),
      decoration: BoxDecoration(
        color: appTheme.blue_gray_100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.h),
          topRight: Radius.circular(30.h),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCompletedSection(),
          _buildPendingSection(),
          _buildFabSection(),
        ],
      ),
    );
  }

  Widget _buildCompletedSection() {
    return Container(
      margin: EdgeInsets.only(top: 40.h, right: 34.h, left: 26.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 18.h,
        children: [
          Text(
            'Concluídas',
            style: TextStyleHelper.instance.headline24BoldInter.copyWith(
              height: 1.25,
            ),
          ),
          Obx(
            () => Column(
              spacing: 12.h,
              children: controller.completedTasks
                  .map(
                    (task) => TaskItemWidget(
                      task: task,
                      onTap: () => controller.toggleTaskStatus(task),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingSection() {
    return Container(
      margin: EdgeInsets.only(top: 16.h, right: 34.h, left: 26.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Text(
            'Pendentes',
            style: TextStyleHelper.instance.headline24BoldInter.copyWith(
              height: 1.25,
            ),
          ),
          Obx(
            () => controller.pendingTasks.isEmpty
                ? _buildEmptyPendingCard()
                : Column(
                    spacing: 12.h,
                    children: controller.pendingTasks
                        .map(
                          (task) => TaskItemWidget(
                            task: task,
                            onTap: () => controller.toggleTaskStatus(task),
                          ),
                        )
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyPendingCard() {
    return Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: appTheme.blue_50,
        border: Border.all(color: appTheme.blue_100, width: 1.h),
        borderRadius: BorderRadius.circular(20.h),
      ),
    );
  }

  Widget _buildFabSection() {
    return Container(
      margin: EdgeInsets.only(top: 68.h),
      height: 130.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 86.h,
              decoration: BoxDecoration(
                color: appTheme.color19D9D9,
                border: Border.all(color: appTheme.color660000, width: 1.h),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () => controller.onAddTaskTapped(Get.context!),
              child: CustomImageView(
                imagePath: ImageConstant.imgAddTaskButton,
                height: 86.h,
                width: 86.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
