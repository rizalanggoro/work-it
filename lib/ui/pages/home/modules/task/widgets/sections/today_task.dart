import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/task/controller.dart';
import 'package:work_it/ui/values/constant.dart';

class HomeTaskTodayTaskSection extends GetView<HomeTaskController> {
  const HomeTaskTodayTaskSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 8,
            top: 16,
          ),
          child: Text(
            'Today tasks',
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: textTheme.bodyLarge!.fontSize,
            ),
          ),
        ),
        ObxValue(
          (tasks) => ListView.builder(
            itemBuilder: (context, index) {
              final collection = tasks[index];

              collection.category.loadSync();
              final categoryCollection = collection.category.value;

              return ListTile(
                contentPadding: ConstantValues.listTileContentPadding,
                onTap: () => controller.toDetailTask(
                  collection: collection,
                ),
                title: Text(
                  collection.title ?? 'No task title',
                  style: TextStyle(
                    color: colorScheme.onBackground,
                  ),
                ),
                subtitle: Text(
                  categoryCollection?.name ?? 'No task category',
                  style: TextStyle(
                    color: colorScheme.onBackground.withOpacity(.64),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () => controller.doneTask(
                    collection: collection,
                  ),
                  icon: const Icon(Icons.done_rounded),
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
    );
  }
}
