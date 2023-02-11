import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/data/enums/task_filter_type.dart';
import 'package:work_it/ui/pages/home/modules/task/controller.dart';

class HomeTaskView extends GetView<HomeTaskController> {
  const HomeTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Task'),
            const SizedBox(height: 6),
            ObxValue(
              (taskFilter) {
                String data;
                switch (taskFilter.value.type) {
                  case TaskFilterType.allCategories:
                    data = 'All categories';
                    break;
                  case TaskFilterType.noCategory:
                    data = 'No category';
                    break;
                  case TaskFilterType.specificCategory:
                    data = taskFilter.value.categoryCollection?.name ??
                        'Category not found!';
                    break;
                }

                return Text(
                  data,
                  style: TextStyle(
                    color: colorScheme.onBackground.withOpacity(.64),
                    fontSize: textTheme.bodyMedium!.fontSize,
                  ),
                );
              },
              controller.taskFilter,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => controller.showBottomSheetSelectCategory(context),
            icon: const Icon(Icons.category_rounded),
          ),
          const SizedBox(width: 16),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.toCreateTask(),
        child: const Icon(Icons.add_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ObxValue(
              (tasks) => ListView.builder(
                itemBuilder: (context, index) {
                  final collection = tasks[index];

                  collection.category.loadSync();
                  final categoryCollection = collection.category.value;

                  return ListTile(
                    onTap: () {},
                    title: Text(
                      collection.title,
                      style: TextStyle(
                        color: colorScheme.onBackground,
                      ),
                    ),
                    subtitle: Text(
                      categoryCollection?.name ?? 'No category',
                      style: TextStyle(
                        color: colorScheme.onBackground.withOpacity(.64),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.check_rounded),
                    ),
                  );
                },
                itemCount: tasks.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              controller.taskService.tasks,
            ),
          ],
        ),
      ),
    );
  }
}
