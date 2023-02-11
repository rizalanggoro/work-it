import 'package:isar/isar.dart';
import 'package:work_it/data/collections/task.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/results/task.dart';

class TaskRepository {
  final IsarProvider isarProvider;

  TaskRepository({
    required this.isarProvider,
  });

  Future<TaskResult> create({
    required TaskCollection collection,
  }) async {
    String? message = 'Something went wrong! Please try again later...';

    try {
      var isar = await isarProvider.openIsarInstance();

      await isar.writeTxn(() async {
        await isar.taskCollections.put(collection);
        await collection.category.save();
      });

      return TaskResult(success: true);
    } catch (_) {}

    return TaskResult(
      success: false,
      message: message,
    );
  }

  Future<List<TaskCollection>> readAll() async {
    final isar = await isarProvider.openIsarInstance();
    return await isar.taskCollections.where().findAll();
  }

  Future<List<TaskCollection>> readAllNoCategory() async {
    final isar = await isarProvider.openIsarInstance();
    return await isar.taskCollections.filter().categoryIsNull().findAll();
  }

  Future<List<TaskCollection>> readAllByCategory({
    required TaskCategoryCollection collection,
  }) async {
    final isar = await isarProvider.openIsarInstance();
    return await isar.taskCollections
        .filter()
        .category((q) => q.idEqualTo(collection.id))
        .findAll();
  }

  Stream<List<TaskCollection>> stream() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* isar.taskCollections.where().watch();
  }

  Stream<List<TaskCollection>> streamNoCategory() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* isar.taskCollections.filter().categoryIsNull().watch();
  }

  Stream<List<TaskCollection>> streamByCategory({
    required TaskCategoryCollection collection,
  }) async* {
    final isar = await isarProvider.openIsarInstance();
    yield* isar.taskCollections
        .filter()
        .category((q) => q.idEqualTo(collection.id))
        .watch();
  }
}
