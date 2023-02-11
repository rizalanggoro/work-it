import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/task/controller.dart';
import 'package:work_it/ui/values/constant.dart';

class HomeTaskCardDoneTaskWidget extends GetView<HomeTaskController> {
  const HomeTaskCardDoneTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16,
      ),
      child: ListTile(
        contentPadding: ConstantValues.listTileContentPadding,
        onTap: () => controller.toManageTaskCompleted(),
        leading: const CircleAvatar(
          child: Icon(Icons.done_all_rounded),
        ),
        title: Text(
          'Task completed',
          style: TextStyle(
            color: colorScheme.onBackground,
          ),
        ),
        subtitle: Text(
          'You have completed 10 out of 100 tasks!',
          style: TextStyle(
            color: colorScheme.onBackground.withOpacity(.64),
          ),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
