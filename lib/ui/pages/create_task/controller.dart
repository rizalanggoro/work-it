import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/task.dart';
import 'package:work_it/data/collections/detail.dart';
import 'package:work_it/data/collections/task.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/repositories/task.dart';

class CreateTaskController extends GetxController {
  final _devName = 'CreateTaskController';

  final TaskService taskService;
  final TaskRepository taskRepository;

  CreateTaskController({
    required this.taskService,
    required this.taskRepository,
  });

  final TextEditingController controllerTitle = TextEditingController(),
      controllerDetails = TextEditingController();

  final Rx<TaskCategoryCollection?> selectedTaskCategory = Rx(null);
  final Rx<DateTime?> selectedDueDate = Rx(null);

  void toManageTaskCategory() => Get.toNamed(Routes.manageTaskCategory);

  void changeSelectedTaskCategory({
    required TaskCategoryCollection collection,
  }) {
    selectedTaskCategory.value = collection;
    Get.back();
  }

  void create() async {
    final title = controllerTitle.text.trim();
    final details = controllerDetails.text.trim();

    if (title.isNotEmpty) {
      final createdAt = DateTime.now().millisecondsSinceEpoch;

      var collection = TaskCollection(
        title: title,
        details: details,
        isDone: false,
        dueDate: selectedDueDate.value?.millisecondsSinceEpoch,
        detail: DetailCollection(
          createAtEpoch: createdAt,
          updatedAtEpoch: createdAt,
          isUploaded: false,
        ),
      );
      collection.category.value = selectedTaskCategory.value;

      var result = await taskRepository.create(
        collection: collection,
      );

      if (result.success) {
        Get.back();
      } else {
        dev.log(
          result.message ?? 'No error message',
          name: _devName,
        );
      }
    }
  }

  void showDueDatePicker(BuildContext context) async {
    final initialDate = selectedDueDate.value ?? DateTime.now();
    final firstDate = DateTime(initialDate.year - 1);
    final lastDate = DateTime(initialDate.year + 1);

    final result = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (result != null) {
      selectedDueDate.value = result;
    }
  }
}
