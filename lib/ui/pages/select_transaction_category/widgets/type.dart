import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/select_transaction_category/controller.dart';

class SelectTransactionCategoryTypeWidget
    extends GetView<SelectTransactionCategoryController> {
  const SelectTransactionCategoryTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    final transactionTypes = [
      'Income',
      'Spent',
    ];

    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          for (var index = 0; index < transactionTypes.length; index++)
            ObxValue(
              (selectedTransactionType) {
                var isSelected = selectedTransactionType.value == index;

                return Container(
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.only(
                    left: index == 0 ? 16 : 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    color: isSelected
                        ? colorScheme.secondaryContainer
                        : Colors.transparent,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => controller.changeTransactionType(index),
                      child: Container(
                        height: 40,
                        width: (Get.width - 40) / 2,
                        alignment: Alignment.center,
                        child: Text(
                          transactionTypes[index],
                          style: TextStyle(
                            color: isSelected
                                ? colorScheme.onSecondaryContainer
                                : colorScheme.onBackground.withOpacity(.64),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              controller.selectedTransactionType,
            ),
        ],
      ),
    );
  }
}
