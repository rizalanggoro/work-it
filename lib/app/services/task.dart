import 'dart:async';

import 'package:get/get.dart';
import 'package:work_it/data/collections/task.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/enums/task_filter_type.dart';
import 'package:work_it/data/models/filters/task.dart';
import 'package:work_it/data/repositories/task.dart';
import 'package:work_it/data/repositories/task_category.dart';

class TaskService extends GetxService {
  final TaskCategoryRepository taskCategoryRepository;
  final TaskRepository taskRepository;

  TaskService({
    required this.taskCategoryRepository,
    required this.taskRepository,
  });

  // final RxBool selectedAllTaskCategories = RxBool(true);
  // final Rx<TaskCategoryCollection?> selectedTaskCategory = Rx(null);
  final Rx<TaskFilter> taskFilter = Rx(TaskFilter(
    type: TaskFilterType.allCategories,
  ));
  final RxList<TaskCategoryCollection> taskCategories = RxList([]);

  StreamSubscription<List<TaskCollection>>? streamSubscriptionTasks;
  final RxList<TaskCollection> tasks = RxList([]);

  @override
  void onReady() {
    super.onReady();

    _read();
    _listen();

    filterTasks();
  }

  void _read() async {
    taskCategories.value = await taskCategoryRepository.readAll();
    // tasks.value = await taskRepository.readAll();
  }

  void _listen() {
    taskCategoryRepository
        .stream()
        .listen((event) => taskCategories.value = event);
    // streamSubscriptionTasks =
    //     taskRepository.stream().listen((event) => tasks.value = event);
  }

  void filterTasks() async {
    if (streamSubscriptionTasks != null) {
      await streamSubscriptionTasks!.cancel();
    }

    final filter = taskFilter.value;
    final filterType = filter.type;

    switch (filterType) {
      case TaskFilterType.allCategories:
        tasks.value = await taskRepository.readAll();
        streamSubscriptionTasks =
            taskRepository.stream().listen((event) => tasks.value = event);
        break;

      case TaskFilterType.noCategory:
        tasks.value = await taskRepository.readAllNoCategory();
        streamSubscriptionTasks = taskRepository
            .streamNoCategory()
            .listen((event) => tasks.value = event);
        break;

      case TaskFilterType.specificCategory:
        tasks.value = await taskRepository.readAllByCategory(
          collection: filter.categoryCollection!,
        );
        streamSubscriptionTasks = taskRepository
            .streamByCategory(
              collection: filter.categoryCollection!,
            )
            .listen((event) => tasks.value = event);
        break;
    }
  }
}
