import 'package:isar/isar.dart';
import 'package:work_it/data/collections/task.dart';
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

  Stream<List<TaskCollection>> stream() async* {
    final isar = await isarProvider.openIsarInstance();
    yield* isar.taskCollections.where().watch();
  }
}
