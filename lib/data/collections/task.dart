import 'package:isar/isar.dart';
import 'package:work_it/data/collections/detail.dart';
import 'package:work_it/data/collections/task_category.dart';

part 'task.g.dart';

@collection
class TaskCollection {
  Id id = Isar.autoIncrement;

  String? title;
  String? details;
  bool? isDone;
  int? dueDate;

  final category = IsarLink<TaskCategoryCollection>();

  DetailCollection? detail;

  TaskCollection({
    this.title,
    this.details,
    this.detail,
    this.isDone,
    this.dueDate,
  });
}
