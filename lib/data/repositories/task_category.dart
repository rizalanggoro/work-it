import 'package:isar/isar.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/results/task_category.dart';

class TaskCategoryRepository {
  final IsarProvider isarProvider;

  TaskCategoryRepository({
    required this.isarProvider,
  });

  Future<TaskCategoryResult> create({
    required TaskCategoryCollection collection,
  }) async {
    String? message;

    try {
      var isar = await isarProvider.openIsarInstance();

      final queryCollection = await isar.taskCategoryCollections
          .filter()
          .nameEqualTo(collection.name)
          .findFirst();

      if (queryCollection == null) {
        await isar.writeTxn(
          () async => await isar.taskCategoryCollections.put(collection),
        );

        return TaskCategoryResult(success: true);
      } else {
        message =
            'A category with that name has been added! Please try another name...';
      }
    } catch (_) {
      message = 'Something went wrong! Please try again later';
    }

    return TaskCategoryResult(
      success: false,
      message: message,
    );
  }

  Future<TaskCategoryResult> deleteById({
    required int id,
  }) async {
    String? message;

    try {
      var isar = await isarProvider.openIsarInstance();
      await isar.writeTxn(
        () async => await isar.taskCategoryCollections.delete(id),
      );
    } catch (_) {}

    return TaskCategoryResult(
      success: false,
      message: message,
    );
  }

  Future<List<TaskCategoryCollection>> readAll() async {
    var isar = await isarProvider.openIsarInstance();
    return await isar.taskCategoryCollections.where().sortByName().findAll();
  }

  Stream<List<TaskCategoryCollection>> stream() async* {
    var isar = await isarProvider.openIsarInstance();
    yield* isar.taskCategoryCollections.where().sortByName().watch();
  }
}
