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
  StreamSubscription<List<TaskCollection>>? streamSubscriptionFutureTasks;
  StreamSubscription<List<TaskCollection>>? streamSubscriptionPastTasks;
  StreamSubscription<List<TaskCollection>>? streamSubscriptionNoDueTasks;

  StreamSubscription<List<TaskCollection>>? streamSubscriptionTasksCompleted;

  // StreamSubscription<List<TaskCollection>>?
  //     streamSubscriptionTasksFutureCompleted;
  // StreamSubscription<List<TaskCollection>>?
  //     streamSubscriptionTasksPastCompleted;

  final RxList<TaskCollection> tasks = RxList([]);
  final RxList<TaskCollection> futureTasks = RxList([]);
  final RxList<TaskCollection> pastTasks = RxList([]);
  final RxList<TaskCollection> noDueTasks = RxList([]);

  final RxList<TaskCollection> tasksCompleted = RxList([]);

  // final RxList<TaskCollection> futureTasksCompleted = RxList([]);
  // final RxList<TaskCollection> pastTasksCompleted = RxList([]);
  // final RxList<TaskCollection> noDueTasksCompleted = RxList([]);

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
    await streamSubscriptionTasks?.cancel();
    await streamSubscriptionFutureTasks?.cancel();
    await streamSubscriptionPastTasks?.cancel();

    await streamSubscriptionTasksCompleted?.cancel();
    // await streamSubscriptionTasksFutureCompleted?.cancel();
    // await streamSubscriptionTasksPastCompleted?.cancel();

    final filter = taskFilter.value;
    final filterType = filter.type;

    switch (filterType) {
      case TaskFilterType.allCategories:
        tasks.value = await taskRepository.readAll();
        futureTasks.value = await taskRepository.readAllFuture();
        pastTasks.value = await taskRepository.readAllPast();
        noDueTasks.value = await taskRepository.readAllNoDue();

        // todo: reads -> completed
        tasksCompleted.value = await taskRepository.readAllCompleted();

        streamSubscriptionTasks = taskRepository.stream().listen(
              (event) => tasks.value = event,
            );
        streamSubscriptionFutureTasks = taskRepository.streamFuture().listen(
              (event) => futureTasks.value = event,
            );
        streamSubscriptionPastTasks = taskRepository.streamPast().listen(
              (event) => pastTasks.value = event,
            );
        streamSubscriptionNoDueTasks = taskRepository.streamNoDue().listen(
              (event) => noDueTasks.value = event,
            );

        // todo: streams -> completed
        streamSubscriptionTasksCompleted = taskRepository
            .streamCompleted()
            .listen((event) => tasksCompleted.value = event);
        break;

      case TaskFilterType.noCategory:
        tasks.value = await taskRepository.readAllNoCategory();
        futureTasks.value = await taskRepository.readAllFutureNoCategory();
        pastTasks.value = await taskRepository.readAllPastNoCategory();
        noDueTasks.value = await taskRepository.readAllNoDueNoCategory();

        // todo: read completed
        tasksCompleted.value =
            await taskRepository.readAllNoCategoryCompleted();

        streamSubscriptionTasks = taskRepository.streamNoCategory().listen(
              (event) => tasks.value = event,
            );
        streamSubscriptionFutureTasks =
            taskRepository.streamFutureNoCategory().listen(
                  (event) => futureTasks.value = event,
                );
        streamSubscriptionPastTasks =
            taskRepository.streamPastNoCategory().listen(
                  (event) => pastTasks.value = event,
                );
        streamSubscriptionNoDueTasks =
            taskRepository.streamNoDueNoCategory().listen(
                  (event) => noDueTasks.value = event,
                );

        // todo: stream completed
        streamSubscriptionTasksCompleted = taskRepository
            .streamNoCategoryCompleted()
            .listen((event) => tasksCompleted.value = event);
        break;

      case TaskFilterType.specificCategory:
        tasks.value = await taskRepository.readAllByCategory(
          collection: filter.categoryCollection!,
        );
        futureTasks.value = await taskRepository.readAllByCategoryFuture(
          collection: filter.categoryCollection!,
        );
        pastTasks.value = await taskRepository.readAllByCategoryPast(
          collection: filter.categoryCollection!,
        );
        noDueTasks.value = await taskRepository.readAllByCategoryNoDue(
          collection: filter.categoryCollection!,
        );

        // todo: read completed
        tasksCompleted.value = await taskRepository.readAllByCategoryCompleted(
          collection: filter.categoryCollection!,
        );

        streamSubscriptionTasks = taskRepository
            .streamByCategory(
              collection: filter.categoryCollection!,
            )
            .listen((event) => tasks.value = event);
        streamSubscriptionFutureTasks = taskRepository
            .streamByCategoryFuture(
              collection: filter.categoryCollection!,
            )
            .listen((event) => futureTasks.value = event);
        streamSubscriptionPastTasks = taskRepository
            .streamByCategoryPast(
              collection: filter.categoryCollection!,
            )
            .listen((event) => pastTasks.value = event);
        streamSubscriptionNoDueTasks = taskRepository
            .streamByCategoryNoDue(
              collection: filter.categoryCollection!,
            )
            .listen((event) => noDueTasks.value = event);

        // todo: stream completed
        streamSubscriptionTasksCompleted = taskRepository
            .streamByCategoryCompleted(
              collection: filter.categoryCollection!,
            )
            .listen((event) => tasksCompleted.value = event);
        break;
    }
  }
}
