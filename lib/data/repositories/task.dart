import 'dart:developer' as dev;

import 'package:isar/isar.dart';
import 'package:work_it/data/collections/task.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/results/task.dart';

class TaskRepository {
  final _devName = 'TaskRepository';

  final IsarProvider isarProvider;
  int _todayFirstEpoch = 0;
  int _todayLastEpoch = 0;

  TaskRepository({
    required this.isarProvider,
  }) {
    _initDate();
  }

  void _initDate() {
    if (_todayFirstEpoch == 0 || _todayLastEpoch == 0) {
      final currentDate = DateTime.now();
      final currentYear = currentDate.year;
      final currentMonth = currentDate.month;
      final currentDay = currentDate.day;

      var todayFirstEpoch = DateTime(
        currentYear,
        currentMonth,
        currentDay,
      ).millisecondsSinceEpoch;
      todayFirstEpoch -= 1;

      var todayLastEpoch = DateTime(
        currentYear,
        currentMonth,
        (currentDay + 1),
      ).millisecondsSinceEpoch;

      _todayFirstEpoch = todayFirstEpoch;
      _todayLastEpoch = todayLastEpoch;
    }
  }

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

  Future<TaskResult> undone({
    required int id,
  }) async {
    String? message = 'Something went wrong! Please try again later';

    try {
      final isar = await isarProvider.openIsarInstance();

      var doneCollection =
          await isar.taskCollections.where().idEqualTo(id).findFirst();
      if (doneCollection != null) {
        doneCollection.isDone = false;
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

  // todo: all categories
  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      _todayFilter(Isar isar) => isar.taskCollections
          .filter()
          .dueDateIsNotNull()
          .dueDateGreaterThan(_todayFirstEpoch)
          .dueDateLessThan(_todayLastEpoch)
          .isDoneEqualTo(false);

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      _futureFilter(Isar isar) => isar.taskCollections
          .filter()
          .dueDateIsNotNull()
          .dueDateGreaterThan(_todayLastEpoch)
          .isDoneEqualTo(false);

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      _pastFilter(Isar isar) => isar.taskCollections
          .filter()
          .dueDateIsNotNull()
          .dueDateLessThan(_todayFirstEpoch)
          .isDoneEqualTo(false);

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      _noDueFilter(Isar isar) =>
          isar.taskCollections.filter().dueDateIsNull().isDoneEqualTo(false);

  // todo: no category
  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      _todayNoCategoryFilter(Isar isar) => isar.taskCollections
          .filter()
          .dueDateIsNotNull()
          .dueDateGreaterThan(_todayFirstEpoch)
          .dueDateLessThan(_todayLastEpoch)
          .categoryIsNull()
          .isDoneEqualTo(false);

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      _futureNoCategoryFilter(Isar isar) => isar.taskCollections
          .filter()
          .dueDateIsNotNull()
          .dueDateGreaterThan(_todayLastEpoch)
          .categoryIsNull()
          .isDoneEqualTo(false);

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      _pastNoCategoryFilter(Isar isar) => isar.taskCollections
          .filter()
          .dueDateIsNotNull()
          .dueDateLessThan(_todayFirstEpoch)
          .categoryIsNull()
          .isDoneEqualTo(false);

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      _noDueNoCategoryFilter(Isar isar) => isar.taskCollections
          .filter()
          .dueDateIsNull()
          .categoryIsNull()
          .isDoneEqualTo(false);

  // todo: specific category
  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      _todaySpecificCategoryFilter(
    Isar isar,
    TaskCategoryCollection collection,
  ) =>
          isar.taskCollections
              .filter()
              .dueDateIsNotNull()
              .dueDateGreaterThan(_todayFirstEpoch)
              .dueDateLessThan(_todayLastEpoch)
              .category((q) => q.idEqualTo(collection.id))
              .isDoneEqualTo(false);

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      _futureSpecificCategoryFilter(
    Isar isar,
    TaskCategoryCollection collection,
  ) =>
          isar.taskCollections
              .filter()
              .dueDateIsNotNull()
              .dueDateGreaterThan(_todayLastEpoch)
              .category((q) => q.idEqualTo(collection.id))
              .isDoneEqualTo(false);

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      _pastSpecificCategoryFilter(
    Isar isar,
    TaskCategoryCollection collection,
  ) =>
          isar.taskCollections
              .filter()
              .dueDateIsNotNull()
              .dueDateLessThan(_todayFirstEpoch)
              .category((q) => q.idEqualTo(collection.id))
              .isDoneEqualTo(false);

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      _noDueSpecificCategoryFilter(
    Isar isar,
    TaskCategoryCollection collection,
  ) =>
          isar.taskCollections
              .filter()
              .dueDateIsNull()
              .category((q) => q.idEqualTo(collection.id))
              .isDoneEqualTo(false);

  // todo: read
  // todo: -> all categories
  Future<List<TaskCollection>> readAll() async {
    final isar = await isarProvider.openIsarInstance();
    return await _todayFilter(isar).findAll();
  }

  Future<List<TaskCollection>> readAllFuture() async {
    final isar = await isarProvider.openIsarInstance();
    return await _futureFilter(isar).findAll();
  }

  Future<List<TaskCollection>> readAllPast() async {
    final isar = await isarProvider.openIsarInstance();
    return await _pastFilter(isar).findAll();
  }

  Future<List<TaskCollection>> readAllNoDue() async {
    final isar = await isarProvider.openIsarInstance();
    return await _noDueFilter(isar).findAll();
  }

  Future<List<TaskCollection>> readAllCompleted() async {
    final isar = await isarProvider.openIsarInstance();
    return await isar.taskCollections.filter().isDoneEqualTo(true).findAll();
  }

  // todo: -> no category
  Future<List<TaskCollection>> readAllNoCategory() async {
    final isar = await isarProvider.openIsarInstance();
    return await _todayNoCategoryFilter(isar).findAll();
  }

  Future<List<TaskCollection>> readAllFutureNoCategory() async {
    final isar = await isarProvider.openIsarInstance();
    return await _futureNoCategoryFilter(isar).findAll();
  }

  Future<List<TaskCollection>> readAllPastNoCategory() async {
    final isar = await isarProvider.openIsarInstance();
    return await _pastNoCategoryFilter(isar).findAll();
  }

  Future<List<TaskCollection>> readAllNoDueNoCategory() async {
    final isar = await isarProvider.openIsarInstance();
    return await _noDueNoCategoryFilter(isar).findAll();
  }

  Future<List<TaskCollection>> readAllNoCategoryCompleted() async {
    final isar = await isarProvider.openIsarInstance();
    return await isar.taskCollections
        .filter()
        .isDoneEqualTo(true)
        .categoryIsNull()
        .findAll();
  }

  // todo: -> specific category
  Future<List<TaskCollection>> readAllByCategory({
    required TaskCategoryCollection collection,
  }) async {
    final isar = await isarProvider.openIsarInstance();
    return await _todaySpecificCategoryFilter(isar, collection).findAll();
  }

  Future<List<TaskCollection>> readAllByCategoryFuture({
    required TaskCategoryCollection collection,
  }) async {
    final isar = await isarProvider.openIsarInstance();
    return await _futureSpecificCategoryFilter(isar, collection).findAll();
  }

  Future<List<TaskCollection>> readAllByCategoryPast({
    required TaskCategoryCollection collection,
  }) async {
    final isar = await isarProvider.openIsarInstance();
    return await _pastSpecificCategoryFilter(isar, collection).findAll();
  }

  Future<List<TaskCollection>> readAllByCategoryNoDue({
    required TaskCategoryCollection collection,
  }) async {
    final isar = await isarProvider.openIsarInstance();
    return await _noDueSpecificCategoryFilter(isar, collection).findAll();
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

  // todo: streams
  // todo: -> all categories
  Stream<List<TaskCollection>> stream() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* _todayFilter(isar).watch();
  }

  Stream<List<TaskCollection>> streamFuture() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* _futureFilter(isar).watch();
  }

  Stream<List<TaskCollection>> streamPast() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* _pastFilter(isar).watch();
  }

  Stream<List<TaskCollection>> streamNoDue() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* _noDueFilter(isar).watch();
  }

  Stream<List<TaskCollection>> streamCompleted() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* isar.taskCollections.filter().isDoneEqualTo(true).watch();
  }

  // todo: -> no categories
  Stream<List<TaskCollection>> streamNoCategory() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* _todayNoCategoryFilter(isar).watch();
  }

  Stream<List<TaskCollection>> streamFutureNoCategory() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* _futureNoCategoryFilter(isar).watch();
  }

  Stream<List<TaskCollection>> streamPastNoCategory() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* _pastNoCategoryFilter(isar).watch();
  }

  Stream<List<TaskCollection>> streamNoDueNoCategory() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* _noDueNoCategoryFilter(isar).watch();
  }

  Stream<List<TaskCollection>> streamNoCategoryCompleted() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* isar.taskCollections
        .filter()
        .isDoneEqualTo(true)
        .categoryIsNull()
        .watch();
  }

  // todo: -> specific category
  Stream<List<TaskCollection>> streamByCategory({
    required TaskCategoryCollection collection,
  }) async* {
    final isar = await isarProvider.openIsarInstance();
    yield* _todaySpecificCategoryFilter(isar, collection).watch();
  }

  Stream<List<TaskCollection>> streamByCategoryFuture({
    required TaskCategoryCollection collection,
  }) async* {
    final isar = await isarProvider.openIsarInstance();
    yield* _futureSpecificCategoryFilter(isar, collection).watch();
  }

  Stream<List<TaskCollection>> streamByCategoryPast({
    required TaskCategoryCollection collection,
  }) async* {
    final isar = await isarProvider.openIsarInstance();
    yield* _pastSpecificCategoryFilter(isar, collection).watch();
  }

  Stream<List<TaskCollection>> streamByCategoryNoDue({
    required TaskCategoryCollection collection,
  }) async* {
    final isar = await isarProvider.openIsarInstance();
    yield* _noDueSpecificCategoryFilter(isar, collection).watch();
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
