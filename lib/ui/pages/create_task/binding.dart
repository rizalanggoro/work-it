import 'package:get/get.dart';
import 'package:work_it/ui/pages/create_task/controller.dart';

class CreateTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateTaskController());
  }
}
