import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/data/enums/task_filter_type.dart';
import 'package:work_it/ui/pages/home/modules/task/controller.dart';
import 'package:work_it/ui/pages/home/modules/task/widgets/card_done_task.dart';
import 'package:work_it/ui/pages/home/modules/task/widgets/sections/future_task.dart';
import 'package:work_it/ui/pages/home/modules/task/widgets/sections/no_due_date_task.dart';
import 'package:work_it/ui/pages/home/modules/task/widgets/sections/past_task.dart';
import 'package:work_it/ui/pages/home/modules/task/widgets/sections/today_task.dart';
import 'package:work_it/ui/utils/ui_utils.dart';
import 'package:work_it/ui/widgets/conditional_widget.dart';

class HomeTaskView extends GetView<HomeTaskController> {
  const HomeTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Scaffold(
      backgroundColor: UIUtils.backgroundColor(context),
      appBar: AppBar(
        backgroundColor: UIUtils.backgroundColor(context),
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Task'),
            const SizedBox(height: 6),
            ObxValue(
              (taskFilter) {
                String data;
                switch (taskFilter.value.type) {
                  case TaskFilterType.allCategories:
                    data = 'All categories';
                    break;
                  case TaskFilterType.noCategory:
                    data = 'No category';
                    break;
                  case TaskFilterType.specificCategory:
                    data = taskFilter.value.categoryCollection?.name ??
                        'Category not found!';
                    break;
                }

                return Text(
                  data,
                  style: TextStyle(
                    color: colorScheme.onBackground.withOpacity(.64),
                    fontSize: textTheme.bodyMedium!.fontSize,
                  ),
                );
              },
              controller.taskFilter,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => controller.showBottomSheetSelectCategory(context),
            icon: const Icon(Icons.category_rounded),
          ),
          const SizedBox(width: 16),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.toCreateTask(),
        child: const Icon(Icons.add_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTaskCardDoneTaskWidget(),
            ObxValue(
              (noDueTasks) => ConditionalWidget(
                body: const HomeTaskNoDueDateTaskSection(),
                showIf: noDueTasks.isNotEmpty,
              ),
              controller.taskService.noDueTasks,
            ),
            ObxValue(
              (tasks) => ConditionalWidget(
                body: const HomeTaskTodayTaskSection(),
                showIf: tasks.isNotEmpty,
              ),
              controller.taskService.tasks,
            ),
            ObxValue(
              (futureTasks) => ConditionalWidget(
                body: const HomeTaskFutureTaskSection(),
                showIf: futureTasks.isNotEmpty,
              ),
              controller.taskService.futureTasks,
            ),
            ObxValue(
              (pastTasks) => ConditionalWidget(
                body: const HomeTaskPastTaskSection(),
                showIf: pastTasks.isNotEmpty,
              ),
              controller.taskService.pastTasks,
            ),
            const SizedBox(height: 56 + 32),
          ],
        ),
      ),
    );
  }
}
