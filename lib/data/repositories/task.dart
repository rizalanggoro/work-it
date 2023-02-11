import 'dart:developer' as dev;

import 'package:isar/isar.dart';
import 'package:work_it/data/collections/task.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/results/task.dart';

class TaskRepository {
  final _devName = 'TaskRepository';

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

  Future<TaskResult> done({
    required int id,
  }) async {
    String? message = 'Something went wrong! Please try again later';

    try {
      final isar = await isarProvider.openIsarInstance();

      var doneCollection =
          await isar.taskCollections.where().idEqualTo(id).findFirst();
      if (doneCollection != null) {
        doneCollection.isDone = true;
        await isar.writeTxn(() async {
          await isar.taskCollections.put(doneCollection);
        });

        return TaskResult(success: true);
      }
    } catch (error) {
      dev.log(error.toString(), name: _devName);
    }

    return TaskResult(
      success: false,
      message: message,
    );
  }

  Future<List<TaskCollection>> readAll() async {
    final isar = await isarProvider.openIsarInstance();
    return await isar.taskCollections.filter().isDoneEqualTo(false).findAll();
  }

  Future<List<TaskCollection>> readAllCompleted() async {
    final isar = await isarProvider.openIsarInstance();
    return await isar.taskCollections.filter().isDoneEqualTo(true).findAll();
  }

  Future<List<TaskCollection>> readAllNoCategory() async {
    final isar = await isarProvider.openIsarInstance();
    return await isar.taskCollections
        .filter()
        .isDoneEqualTo(false)
        .categoryIsNull()
        .findAll();
  }

  Future<List<TaskCollection>> readAllNoCategoryCompleted() async {
    final isar = await isarProvider.openIsarInstance();
    return await isar.taskCollections
        .filter()
        .isDoneEqualTo(true)
        .categoryIsNull()
        .findAll();
  }

  Future<List<TaskCollection>> readAllByCategory({
    required TaskCategoryCollection collection,
  }) async {
    final isar = await isarProvider.openIsarInstance();
    return await isar.taskCollections
        .filter()
        .isDoneEqualTo(false)
        .category((q) => q.idEqualTo(collection.id))
        .findAll();
  }

  Future<List<TaskCollection>> readAllByCategoryCompleted({
    required TaskCategoryCollection collection,
  }) async {
    final isar = await isarProvider.openIsarInstance();
    return await isar.taskCollections
        .filter()
        .isDoneEqualTo(true)
        .category((q) => q.idEqualTo(collection.id))
        .findAll();
  }

  Stream<List<TaskCollection>> stream() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* isar.taskCollections.filter().isDoneEqualTo(false).watch();
  }

  Stream<List<TaskCollection>> streamCompleted() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* isar.taskCollections.filter().isDoneEqualTo(true).watch();
  }

  Stream<List<TaskCollection>> streamNoCategory() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* isar.taskCollections
        .filter()
        .isDoneEqualTo(false)
        .categoryIsNull()
        .watch();
  }

  Stream<List<TaskCollection>> streamNoCategoryCompleted() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* isar.taskCollections
        .filter()
        .isDoneEqualTo(true)
        .categoryIsNull()
        .watch();
  }

  Stream<List<TaskCollection>> streamByCategory({
    required TaskCategoryCollection collection,
  }) async* {
    final isar = await isarProvider.openIsarInstance();
    yield* isar.taskCollections
        .filter()
        .isDoneEqualTo(false)
        .category((q) => q.idEqualTo(collection.id))
        .watch();
  }

  Stream<List<TaskCollection>> streamByCategoryCompleted({
    required TaskCategoryCollection collection,
  }) async* {
    final isar = await isarProvider.openIsarInstance();
    yield* isar.taskCollections
        .filter()
        .isDoneEqualTo(true)
        .category((q) => q.idEqualTo(collection.id))
        .watch();
  }
}
