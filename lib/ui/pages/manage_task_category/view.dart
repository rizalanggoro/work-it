import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/manage_task_category/controller.dart';
import 'package:work_it/ui/pages/manage_task_category/views/bottom_sheet_create.dart';

class ManageTaskCategoryView extends GetView<ManageTaskCategoryController> {
  const ManageTaskCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Category'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheetCreate(context),
        child: const Icon(Icons.add_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ObxValue(
              (taskCategories) => ListView.builder(
                itemBuilder: (context, index) {
                  var collection = taskCategories[index];

                  return ListTile(
                    title: Text(
                      collection.name,
                      style: TextStyle(
                        color: colorScheme.onBackground,
                      ),
                    ),
                    subtitle: Text(
                      collection.id.toString(),
                      style: TextStyle(
                        color: colorScheme.onBackground.withOpacity(.64),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => controller.delete(
                        collection: collection,
                      ),
                      icon: const Icon(Icons.delete_rounded),
                    ),
                  );
                },
                itemCount: taskCategories.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              controller.taskService.taskCategories,
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheetCreate(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const ManageTaskCategoryBottomSheetCreateView(),
    );
  }
}
