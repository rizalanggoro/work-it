import 'package:get/get.dart';
import 'package:work_it/data/collections/task.dart';

class DetailTaskController extends GetxController {
  late TaskCollection taskCollection;

  @override
  void onInit() {
    super.onInit();

    final argument = Get.arguments;
    if (argument != null) {
      taskCollection = argument as TaskCollection;
    } else {
      Get.back();
    }
  }
}
