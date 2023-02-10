import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/task/controller.dart';

class HomeTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeTaskController());
  }
}
