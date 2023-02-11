import 'package:get/get.dart';
import 'package:work_it/app/services/task.dart';

class ManageTaskCompletedController extends GetxController {
  final TaskService taskService;

  ManageTaskCompletedController({
    required this.taskService,
  });
}
