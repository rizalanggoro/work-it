import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:work_it/ui/pages/create_task/controller.dart';
import 'package:work_it/ui/pages/create_task/views/bottom_sheet_select_category.dart';
import 'package:work_it/ui/utils/ui_utils.dart';
import 'package:work_it/ui/values/constant.dart';

class CreateTaskView extends GetView<CreateTaskController> {
  const CreateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Scaffold(
      backgroundColor: UIUtils.backgroundColor(context),
      appBar: AppBar(
        backgroundColor: UIUtils.backgroundColor(context),
        title: const Text('Create task'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: TextField(
                controller: controller.controllerTitle,
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Title'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 16,
              ),
              child: TextField(
                controller: controller.controllerDetails,
                minLines: 3,
                maxLines: null,
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Details'),
                  alignLabelWithHint: true,
                ),
              ),
            ),

            // todo: category
            ListTile(
              contentPadding: ConstantValues.listTileContentPadding,
              onTap: () => _showBottomSheetSelectCategory(context),
              leading: const CircleAvatar(
                child: Icon(Icons.category_rounded),
              ),
              title: Text(
                'Category',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: ObxValue(
                (selectedTaskCategory) => Text(
                  selectedTaskCategory.value?.name ?? 'No category selected',
                  style: TextStyle(
                    color: colorScheme.onBackground.withOpacity(.64),
                  ),
                ),
                controller.selectedTaskCategory,
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
            ),

            // todo: due date
            ListTile(
              contentPadding: ConstantValues.listTileContentPadding,
              onTap: () => controller.showDueDatePicker(context),
              leading: const CircleAvatar(
                child: Icon(Icons.today_rounded),
              ),
              title: Text(
                'Due date',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: ObxValue(
                (selectedDueDate) => Text(
                  selectedDueDate.value != null
                      ? DateFormat('EEEE, d MMM yyyy').format(
                          selectedDueDate.value!,
                        )
                      : 'No due date',
                  style: TextStyle(
                    color: colorScheme.onBackground.withOpacity(.64),
                  ),
                ),
                controller.selectedDueDate,
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
            ),

            // todo: button submit
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: ElevatedButton(
                onPressed: () => controller.create(),
                child: const Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheetSelectCategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const CreateTaskBottomSheetSelectCategoryView(),
    );
  }
}
