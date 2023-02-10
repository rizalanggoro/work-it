import 'package:get/get.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/repositories/task_category.dart';

class TaskService extends GetxService {
  final TaskCategoryRepository taskCategoryRepository;

  TaskService({
    required this.taskCategoryRepository,
  });

  final RxList<TaskCategoryCollection> taskCategories = RxList([]);

  @override
  void onReady() {
    super.onReady();

    _read();
    _listen();
  }

  void _read() async {
    taskCategories.value = await taskCategoryRepository.readAll();
  }

  void _listen() {
    taskCategoryRepository
        .stream()
        .listen((event) => taskCategories.value = event);
  }
}
