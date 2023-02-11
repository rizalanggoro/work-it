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

  final Rx<TaskFilter> taskFilter = Rx(TaskFilter(
    type: TaskFilterType.allCategories,
  ));
  final RxList<TaskCategoryCollection> taskCategories = RxList([]);

  StreamSubscription<List<TaskCollection>>? streamSubscriptionTasks;
  StreamSubscription<List<TaskCollection>>? streamSubscriptionTasksCompleted;
  final RxList<TaskCollection> tasks = RxList([]);
  final RxList<TaskCollection> tasksCompleted = RxList([]);

  @override
  void onReady() {
    super.onReady();

    _read();
    _listen();

    filterTasks();
  }

  void _read() async {
    taskCategories.value = await taskCategoryRepository.readAll();
  }

  void _listen() {
    taskCategoryRepository
        .stream()
        .listen((event) => taskCategories.value = event);
  }

  void filterTasks() async {
    if (streamSubscriptionTasks != null) {
      await streamSubscriptionTasks!.cancel();
    }

    if (streamSubscriptionTasksCompleted != null) {
      await streamSubscriptionTasksCompleted!.cancel();
    }

    final filter = taskFilter.value;
    final filterType = filter.type;

    switch (filterType) {
      case TaskFilterType.allCategories:
        tasks.value = await taskRepository.readAll();
        tasksCompleted.value = await taskRepository.readAllCompleted();

        streamSubscriptionTasks =
            taskRepository.stream().listen((event) => tasks.value = event);
        streamSubscriptionTasksCompleted = taskRepository
            .streamCompleted()
            .listen((event) => tasksCompleted.value = event);
        break;

      case TaskFilterType.noCategory:
        tasks.value = await taskRepository.readAllNoCategory();
        tasksCompleted.value =
            await taskRepository.readAllNoCategoryCompleted();

        streamSubscriptionTasks = taskRepository
            .streamNoCategory()
            .listen((event) => tasks.value = event);
        streamSubscriptionTasksCompleted = taskRepository
            .streamNoCategoryCompleted()
            .listen((event) => tasksCompleted.value = event);
        break;

      case TaskFilterType.specificCategory:
        tasks.value = await taskRepository.readAllByCategory(
          collection: filter.categoryCollection!,
        );
        tasksCompleted.value = await taskRepository.readAllByCategoryCompleted(
          collection: filter.categoryCollection!,
        );

        streamSubscriptionTasks = taskRepository
            .streamByCategory(
              collection: filter.categoryCollection!,
            )
            .listen((event) => tasks.value = event);
        streamSubscriptionTasksCompleted = taskRepository
            .streamByCategoryCompleted(
              collection: filter.categoryCollection!,
            )
            .listen((event) => tasksCompleted.value = event);
        break;
    }
  }
}
