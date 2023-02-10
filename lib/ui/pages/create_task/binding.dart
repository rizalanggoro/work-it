import 'package:get/get.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/repositories/task.dart';
import 'package:work_it/ui/pages/create_task/controller.dart';

class CreateTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IsarProvider());

    Get.put(TaskRepository(
      isarProvider: Get.find(),
    ));

    Get.put(CreateTaskController(
      taskService: Get.find(),
      taskRepository: Get.find(),
    ));
  }
}
