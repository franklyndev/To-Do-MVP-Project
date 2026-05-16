import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/task_model.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onTap;

  TaskItemWidget({Key? key, required this.task, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 14.h,
          right: 16.h,
          bottom: 14.h,
          left: 16.h,
        ),
        decoration: BoxDecoration(
          color: appTheme.blue_50,
          border: Border.all(color: appTheme.blue_100, width: 1.h),
          borderRadius: BorderRadius.circular(20.h),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => task.isCompleted.value
                  ? CustomImageView(
                      imagePath: ImageConstant.imgFrame,
                      height: 40.h,
                      width: 38.h,
                      fit: BoxFit.contain,
                    )
                  : Container(
                      height: 40.h,
                      width: 38.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: appTheme.blue_100,
                          width: 2.h,
                        ),
                      ),
                    ),
            ),
            SizedBox(width: 28.h),
            Expanded(
              child: Obx(
                () => Text(
                  task.title.value,
                  style: TextStyleHelper.instance.title20RegularInter.copyWith(
                    height: 1.25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
