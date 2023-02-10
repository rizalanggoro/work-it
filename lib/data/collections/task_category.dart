import 'package:isar/isar.dart';
import 'package:work_it/data/collections/detail.dart';

part 'task_category.g.dart';

@collection
class TaskCategoryCollection {
  Id id = Isar.autoIncrement;

  String name;

  DetailCollection detail;

  TaskCategoryCollection({
    required this.name,
    required this.detail,
  });
}
