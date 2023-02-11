import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/task.dart';
import 'package:work_it/data/collections/task.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/enums/task_filter_type.dart';
import 'package:work_it/data/models/filters/task.dart';
import 'package:work_it/data/repositories/task.dart';
import 'package:work_it/ui/pages/home/modules/task/views/bottom_sheet_select_category.dart';

class HomeTaskController extends GetxController {
  final _devName = 'HomeTaskController';

  final TaskService taskService;
  final TaskRepository taskRepository;

  HomeTaskController({
    required this.taskService,
    required this.taskRepository,
  });

  Rx<TaskFilter> get taskFilter => taskService.taskFilter;

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

  void doneTask({
    required TaskCollection collection,
  }) async {
    var result = await taskRepository.done(
      id: collection.id,
    );

    if (!result.success) {
      dev.log(result.message ?? 'No error message', name: _devName);
    }
  }
}
