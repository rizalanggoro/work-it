import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/profile/controller.dart';

class HomeProfileSectionTask extends GetView<HomeProfileController> {
  const HomeProfileSectionTask({super.key});

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
            top: 16,
            bottom: 8,
          ),
          child: Text(
            'Task',
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: textTheme.titleMedium!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          onTap: () => controller.toManageTaskCategory(),
          leading: const CircleAvatar(
            child: Icon(Icons.category_rounded),
          ),
          title: Text(
            'Manage category',
            style: TextStyle(
              color: colorScheme.onBackground,
            ),
          ),
          subtitle: Text(
            'Create, update, delete task category',
            style: TextStyle(
              color: colorScheme.onBackground,
            ),
          ),
          trailing: const Icon(Icons.chevron_right_rounded),
        ),
      ],
    );
  }
}
