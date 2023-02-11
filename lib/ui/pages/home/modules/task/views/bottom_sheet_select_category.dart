import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/task/controller.dart';

class HomeTaskBottomSheetSelectCategoryView
    extends GetView<HomeTaskController> {
  const HomeTaskBottomSheetSelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 24,
            right: 16,
            left: 16,
            bottom: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: TextStyle(
                  color: colorScheme.onBackground,
                  fontSize: textTheme.titleLarge!.fontSize,
                ),
              ),
              IconButton(
                onPressed: () => controller.toManageTaskCategory(),
                icon: const Icon(Icons.edit_rounded),
              ),
            ],
          ),
        ),

        // todo: all
        ListTile(
          onTap: () => controller.changeSelectedTaskCategory(),
          leading: ObxValue(
            (selectedTaskCategory) {
              final isSelected = selectedTaskCategory.value == null;
              return Icon(
                isSelected
                    ? Icons.radio_button_on_rounded
                    : Icons.radio_button_off_rounded,
                color: isSelected ? colorScheme.primary : colorScheme.secondary,
              );
            },
            controller.selectedTaskCategory,
          ),
          title: Text(
            'All categories',
            style: TextStyle(
              color: colorScheme.onBackground,
            ),
          ),
        ),
        const Divider(),
        ObxValue(
          (taskCategories) => ListView.builder(
            itemBuilder: (context, index) {
              final collection = taskCategories[index];

              return ListTile(
                onTap: () => controller.changeSelectedTaskCategory(
                  collection: collection,
                ),
                leading: ObxValue(
                  (selectedTaskCategory) {
                    final isSelected =
                        selectedTaskCategory.value?.id == collection.id;

                    return Icon(
                      isSelected
                          ? Icons.radio_button_on_rounded
                          : Icons.radio_button_off_rounded,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.secondary,
                    );
                  },
                  controller.selectedTaskCategory,
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
          ),
          controller.taskService.taskCategories,
        ),

        // todo: spacer
        const SizedBox(height: 24),
      ],
    );
  }
}
