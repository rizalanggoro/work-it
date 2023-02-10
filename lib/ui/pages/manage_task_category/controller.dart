import 'package:get/get.dart';
import 'package:work_it/app/services/task.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/repositories/task_category.dart';

class ManageTaskCategoryController extends GetxController {
  final TaskService taskService;
  final TaskCategoryRepository taskCategoryRepository;

  ManageTaskCategoryController({
    required this.taskService,
    required this.taskCategoryRepository,
  });

  void delete({
    required TaskCategoryCollection collection,
  }) async {
    var result = await taskCategoryRepository.deleteById(
      id: collection.id,
    );
  }
}
