import 'package:get/get.dart';
import 'package:work_it/data/repositories/task.dart';
import 'package:work_it/ui/pages/home/modules/task/controller.dart';

class HomeTaskBinding extends Bindings {
  @override
  void dependencies() {
    // todo: repositories
    Get.put(TaskRepository(
      isarProvider: Get.find(),
    ));

    // todo: controllers
    Get.put(HomeTaskController(
      taskService: Get.find(),
      taskRepository: Get.find(),
    ));
  }
}
