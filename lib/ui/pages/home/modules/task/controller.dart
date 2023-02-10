import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';

class HomeTaskController extends GetxController {
  void toCreateTask() => Get.toNamed(Routes.createTask);
}
