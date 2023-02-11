import 'package:get/get.dart';
import 'package:work_it/app/services/task.dart';
import 'package:work_it/data/collections/task.dart';
import 'package:work_it/data/repositories/task.dart';

class ManageTaskCompletedController extends GetxController {
  final TaskService taskService;
  final TaskRepository taskRepository;

  ManageTaskCompletedController({
    required this.taskService,
    required this.taskRepository,
  });

  void undone({
    required TaskCollection collection,
  }) async {
    var result = await taskRepository.undone(
      id: collection.id,
    );
  }
}
