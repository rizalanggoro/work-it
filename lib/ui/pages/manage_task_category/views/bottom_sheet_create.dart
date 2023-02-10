import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/manage_task_category/controllers/create.dart';
import 'package:work_it/ui/widgets/conditional_widget.dart';
import 'package:work_it/ui/widgets/error_container.dart';

class ManageTaskCategoryBottomSheetCreateView
    extends GetView<ManageTaskCategoryCreateController> {
  const ManageTaskCategoryBottomSheetCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: context.mediaQuery.viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: Text(
                'Create a new category',
                style: TextStyle(
                  color: colorScheme.onBackground,
                  fontSize: textTheme.titleLarge!.fontSize,
                ),
              ),
            ),

            // todo: error container
            ObxValue(
              (errorMessage) => ConditionalWidget(
                body: ErrorContainer(
                  message: errorMessage.value,
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 24,
                  ),
                ),
                showIf: errorMessage.value.isNotEmpty,
              ),
              controller.errorMessage,
            ),

            // todo: name
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: TextField(
                controller: controller.controllerName,
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Name'),
                ),
              ),
            ),

            // todo: button submit
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              alignment: Alignment.centerRight,
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
}
