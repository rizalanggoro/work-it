import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/manage_task_category/controller.dart';

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
    );
  }
}
