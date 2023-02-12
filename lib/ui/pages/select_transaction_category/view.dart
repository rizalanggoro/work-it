import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/select_transaction_category/controller.dart';
import 'package:work_it/ui/pages/select_transaction_category/widgets/type.dart';
import 'package:work_it/ui/utils/ui_utils.dart';

class SelectTransactionCategoryView
    extends GetView<SelectTransactionCategoryController> {
  const SelectTransactionCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.theme.colorScheme;

    return Scaffold(
      backgroundColor: UIUtils.backgroundColor(context),
      appBar: AppBar(
        backgroundColor: UIUtils.backgroundColor(context),
        title: const Text('Select category'),
        actions: [
          IconButton(
            onPressed: () => controller.toManageTransactionCategory(),
            icon: const Icon(Icons.category_rounded),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // todo: type
          const SelectTransactionCategoryTypeWidget(),

          const SizedBox(height: 16),

          // todo: list transaction category
          ObxValue(
            (selectedTransactionType) {
              var isIncome = selectedTransactionType.value == 0;
              return ObxValue(
                (categories) => ListView.builder(
                  itemBuilder: (context, index) {
                    final collection = categories[index];

                    return ListTile(
                      onTap: () => controller.changeTransactionCategory(
                        collection: collection,
                      ),
                      leading: ObxValue(
                        (selectedTransactionCategory) {
                          var isSelected =
                              selectedTransactionCategory.value?.id ==
                                  collection.id;
                          return Icon(
                            isSelected
                                ? Icons.radio_button_on_rounded
                                : Icons.radio_button_off_rounded,
                            color: isSelected
                                ? colorScheme.primary
                                : colorScheme.secondary,
                          );
                        },
                        controller.selectedTransactionCategory,
                      ),
                      title: Text(
                        collection.name,
                        style: TextStyle(
                          color: colorScheme.onBackground,
                        ),
                      ),
                    );
                  },
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                isIncome
                    ? controller.transactionService.incomeTransactionCategories
                    : controller.transactionService.spentTransactionCategories,
              );
            },
            controller.selectedTransactionType,
          ),
        ],
      ),
    );
  }
}
