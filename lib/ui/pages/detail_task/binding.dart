import 'package:get/get.dart';
import 'package:work_it/ui/pages/detail_task/controller.dart';

class DetailTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailTaskController());
  }
}
