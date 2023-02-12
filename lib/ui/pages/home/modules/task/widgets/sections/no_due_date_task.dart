import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/task/controller.dart';
import 'package:work_it/ui/values/constant.dart';

class HomeTaskNoDueDateTaskSection extends GetView<HomeTaskController> {
  const HomeTaskNoDueDateTaskSection({super.key});

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
            top: 16,
            bottom: 8,
          ),
          child: Text(
            'Tasks without deadlines',
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: textTheme.bodyLarge!.fontSize,
            ),
          ),
        ),
        ObxValue(
          (noDueTasks) => ListView.builder(
            itemBuilder: (context, index) {
              final collection = noDueTasks[index];

              collection.category.loadSync();
              final categoryCollection = collection.category.value;

              var subtitle = categoryCollection?.name ?? 'No task category';

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
                  subtitle,
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
            itemCount: noDueTasks.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
          controller.taskService.noDueTasks,
        ),
      ],
    );
  }
}
