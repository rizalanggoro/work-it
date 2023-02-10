import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/create_task/controller.dart';

class CreateTaskBottomSheetSelectCategoryView
    extends GetView<CreateTaskController> {
  const CreateTaskBottomSheetSelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Container(
      margin: EdgeInsets.only(
        bottom: context.mediaQuery.viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Select category',
                      style: TextStyle(
                        color: colorScheme.onBackground,
                        fontSize: textTheme.titleLarge!.fontSize,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => controller.toManageTaskCategory(),
                    icon: const Icon(Icons.edit_rounded),
                  ),
                ],
              ),
            ),

            // todo: list categories
            ObxValue(
              (taskCategories) => ListView.builder(
                itemBuilder: (context, index) {
                  var collection = taskCategories[index];

                  var isSelected = collection.id ==
                      controller.selectedTaskCategory.value?.id;

                  return ListTile(
                    onTap: () => controller.changeSelectedTaskCategory(
                      collection: collection,
                    ),
                    leading: Icon(
                      isSelected
                          ? Icons.radio_button_on_rounded
                          : Icons.radio_button_off_rounded,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.secondary,
                    ),
                    title: Text(
                      collection.name,
                      style: TextStyle(
                        color: colorScheme.onBackground,
                      ),
                    ),
                  );
                },
                itemCount: taskCategories.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              controller.taskService.taskCategories,
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
