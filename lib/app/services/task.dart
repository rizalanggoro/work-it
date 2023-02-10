import 'package:get/get.dart';
import 'package:work_it/data/collections/task.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/repositories/task.dart';
import 'package:work_it/data/repositories/task_category.dart';

class TaskService extends GetxService {
  final TaskCategoryRepository taskCategoryRepository;
  final TaskRepository taskRepository;

  TaskService({
    required this.taskCategoryRepository,
    required this.taskRepository,
  });

  final RxList<TaskCategoryCollection> taskCategories = RxList([]);
  final RxList<TaskCollection> tasks = RxList([]);

  @override
  void onReady() {
    super.onReady();

    _read();
    _listen();
  }

  void _read() async {
    taskCategories.value = await taskCategoryRepository.readAll();
    tasks.value = await taskRepository.readAll();
  }

  void _listen() {
    taskCategoryRepository
        .stream()
        .listen((event) => taskCategories.value = event);
    taskRepository.stream().listen((event) => tasks.value = event);
  }
}
