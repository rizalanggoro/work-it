import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/task.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/enums/task_filter_type.dart';
import 'package:work_it/data/models/filters/task.dart';
import 'package:work_it/ui/pages/home/modules/task/views/bottom_sheet_select_category.dart';

class HomeTaskController extends GetxController {
  final TaskService taskService;

  HomeTaskController({
    required this.taskService,
  });

  Rx<TaskFilter> get taskFilter => taskService.taskFilter;

  // Rx<TaskCategoryCollection?> get selectedTaskCategory =>
  //     taskService.selectedTaskCategory;
  //
  // RxBool get selectedAllTaskCategories => taskService.selectedAllTaskCategories;

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
    required TaskFilterType type,
  }) {
    var filterModel = TaskFilter(type: type);
    if (type == TaskFilterType.specificCategory) {
      filterModel.categoryCollection = collection;
    }

    taskFilter.value = filterModel;
    taskService.filterTasks();
    Get.back();
  }
}
