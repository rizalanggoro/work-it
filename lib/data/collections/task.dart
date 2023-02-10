import 'package:isar/isar.dart';
import 'package:work_it/data/collections/detail.dart';
import 'package:work_it/data/collections/task_category.dart';

part 'task.g.dart';

@collection
class TaskCollection {
  Id id = Isar.autoIncrement;

  String title;
  String? details;

  final category = IsarLink<TaskCategoryCollection>();

  DetailCollection detail;

  TaskCollection({
    required this.title,
    this.details,
    required this.detail,
  });
}
