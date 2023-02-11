import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/enums/task_filter_type.dart';

class TaskFilter {
  final TaskFilterType type;
  TaskCategoryCollection? categoryCollection;

  TaskFilter({
    required this.type,
    this.categoryCollection,
  });
}
