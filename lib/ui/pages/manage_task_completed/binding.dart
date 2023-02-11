import 'package:get/get.dart';
import 'package:work_it/data/repositories/task.dart';
import 'package:work_it/ui/pages/manage_task_completed/controller.dart';

class ManageTaskCompletedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskRepository(
      isarProvider: Get.find(),
    ));

    Get.put(ManageTaskCompletedController(
      taskService: Get.find(),
      taskRepository: Get.find(),
    ));
  }
}
