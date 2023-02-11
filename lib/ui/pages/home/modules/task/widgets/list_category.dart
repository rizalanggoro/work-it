import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/task/controller.dart';

class HomeTaskListCategoryWidget extends GetView<HomeTaskController> {
  const HomeTaskListCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Container(
      height: 32,
      child: ObxValue(
        (taskCategories) => ListView.builder(
          itemBuilder: (context, index) {
            final collection = taskCategories[index];

            return Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 16 : 8,
                right: index == (taskCategories.length - 1) ? 16 : 0,
              ),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    child: Text(
                      collection.name,
                      style: TextStyle(
                        color: colorScheme.onBackground,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: taskCategories.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
        ),
        controller.taskService.taskCategories,
      ),
    );
  }
}
