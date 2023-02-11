import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/task.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/ui/pages/home/modules/task/views/bottom_sheet_select_category.dart';

class HomeTaskController extends GetxController {
  final TaskService taskService;

  HomeTaskController({
    required this.taskService,
  });

  final Rx<TaskCategoryCollection?> selectedTaskCategory = Rx(null);

  void toCreateTask() => Get.toNamed(Routes.createTask);

  void toManageTaskCategory() {
    Get.back();
    Get.toNamed(Routes.manageTaskCategory);
  }

  void showBottomSheetSelectCategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const HomeTaskBottomSheetSelectCategoryView(),
    );
  }

  void changeSelectedTaskCategory({
    TaskCategoryCollection? collection,
  }) {
    selectedTaskCategory.value = collection;
    Get.back();
  }
}
