import 'package:get/get.dart';
import 'package:work_it/data/repositories/task_category.dart';
import 'package:work_it/ui/pages/manage_task_category/controller.dart';
import 'package:work_it/ui/pages/manage_task_category/controllers/create.dart';

class ManageTaskCategoryBinding extends Bindings {
  @override
  void dependencies() {
    // todo: repositories
    Get.put(TaskCategoryRepository(
      isarProvider: Get.find(),
    ));

    // todo: controllers
    Get.put(ManageTaskCategoryController(
      taskService: Get.find(),
      taskCategoryRepository: Get.find(),
    ));
    Get.put(ManageTaskCategoryCreateController(
      taskCategoryRepository: Get.find(),
    ));
  }
}
