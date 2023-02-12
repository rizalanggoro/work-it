import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:work_it/ui/pages/detail_task/controller.dart';
import 'package:work_it/ui/values/constant.dart';
import 'package:work_it/ui/widgets/conditional_widget.dart';

class DetailTaskView extends GetView<DetailTaskController> {
  const DetailTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail task'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_rounded),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // todo: title
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Text(
                controller.taskCollection.title ?? 'No task title',
                style: TextStyle(
                  color: colorScheme.onBackground,
                  fontSize: textTheme.bodyLarge!.fontSize,
                ),
              ),
            ),

            // todo: details
            if (controller.taskCollection.details?.isNotEmpty ?? false)
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                child: Text(
                  controller.taskCollection.details ?? 'No task details',
                  style: TextStyle(
                    color: colorScheme.onBackground,
                    fontSize: textTheme.bodyLarge!.fontSize,
                  ),
                ),
              ),

            // todo: due date
            if (controller.taskCollection.dueDate != null)
              ListTile(
                contentPadding: ConstantValues.listTileContentPadding,
                leading: const CircleAvatar(
                  child: Icon(Icons.today_rounded),
                ),
                title: Text(
                  'Due date',
                  style: TextStyle(
                    color: colorScheme.onBackground,
                  ),
                ),
                subtitle: Text(
                  DateFormat(DateFormat.YEAR_MONTH_DAY).format(
                    DateTime.fromMillisecondsSinceEpoch(
                        controller.taskCollection.dueDate!),
                  ),
                  style: TextStyle(
                    color: colorScheme.onBackground.withOpacity(.64),
                  ),
                ),
              ),

            // todo: category
            FutureBuilder(
              builder: (context, snapshot) {
                final categoryCollection =
                    controller.taskCollection.category.value;

                return ConditionalWidget(
                  body: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.category_rounded),
                    ),
                    title: Text(
                      'Category',
                      style: TextStyle(
                        color: colorScheme.onBackground,
                      ),
                    ),
                    subtitle: Text(
                      categoryCollection?.name ?? 'No category name',
                      style: TextStyle(
                        color: colorScheme.onBackground.withOpacity(.64),
                      ),
                    ),
                  ),
                  showIf: categoryCollection != null,
                );
              },
              future: controller.taskCollection.category.load(),
            ),

            // todo: delete button
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: ElevatedButton(
                child: const Text('Delete task'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
