import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/create_task/controller.dart';

class CreateTaskView extends GetView<CreateTaskController> {
  const CreateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create task'),
      ),
    );
  }
}
