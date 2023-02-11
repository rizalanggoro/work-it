import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/manage_task_completed/controller.dart';

class ManageTaskCompletedView extends GetView<ManageTaskCompletedController> {
  const ManageTaskCompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task completed'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.category_rounded),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ObxValue(
              (tasksCompleted) => ListView.builder(
                itemBuilder: (context, index) {
                  var collection = tasksCompleted[index];

                  collection.category.loadSync();
                  var categoryCollection = collection.category.value;

                  return ListTile(
                    title: Text(
                      collection.title ?? 'No title',
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
                      icon: const Icon(Icons.remove_done_rounded),
                      onPressed: () => controller.undone(
                        collection: collection,
                      ),
                    ),
                  );
                },
                itemCount: tasksCompleted.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              controller.taskService.tasksCompleted,
            ),
          ],
        ),
      ),
    );
  }
}
