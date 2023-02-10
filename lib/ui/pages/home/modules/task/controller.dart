import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/task.dart';

class HomeTaskController extends GetxController {
  final TaskService taskService;

  HomeTaskController({
    required this.taskService,
  });

  void toCreateTask() => Get.toNamed(Routes.createTask);
}
