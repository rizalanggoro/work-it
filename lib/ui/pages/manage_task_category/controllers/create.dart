import 'dart:developer' as dev;

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:work_it/data/collections/detail.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/repositories/task_category.dart';

class ManageTaskCategoryCreateController extends GetxController {
  final _devName = 'ManageTaskCategoryCreateController';

  final TaskCategoryRepository taskCategoryRepository;

  ManageTaskCategoryCreateController({
    required this.taskCategoryRepository,
  });

  final TextEditingController controllerName = TextEditingController();
  final RxString errorMessage = RxString('');

  void create() async {
    final name = controllerName.text.trim();
    if (name.isNotEmpty) {
      errorMessage.value = '';

      var createdAt = DateTime.now().millisecondsSinceEpoch;
      var collection = TaskCategoryCollection(
        name: name,
        detail: DetailCollection(
          createAtEpoch: createdAt,
          updatedAtEpoch: createdAt,
          isUploaded: false,
        ),
      );

      var result = await taskCategoryRepository.create(
        collection: collection,
      );

      if (result.success) {
        controllerName.clear();
        errorMessage.value = '';

        Get.back();
      } else {
        errorMessage.value = result.message ?? 'No error message';

        dev.log(
          errorMessage.value,
          name: _devName,
        );
      }
    }
  }
}
