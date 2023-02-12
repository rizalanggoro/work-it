import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/manage_transaction_category/controller.dart';
import 'package:work_it/ui/utils/ui_utils.dart';

class ManageTransactionCategoryView
    extends GetView<ManageTransactionCategoryController> {
  const ManageTransactionCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = context.theme.colorScheme;
    var textTheme = context.textTheme;

    return Scaffold(
      backgroundColor: UIUtils.backgroundColor(context),
      appBar: AppBar(
        backgroundColor: UIUtils.backgroundColor(context),
        title: const Text('Category'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add_rounded,
        ),
        onPressed: () => controller.toCreateTransactionCategory(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // todo: income
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 8,
              ),
              child: Text(
                'Income',
                style: TextStyle(
                  color: colorScheme.onBackground,
                  fontSize: textTheme.titleMedium!.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ObxValue(
              (transactionCategory) => ListView.builder(
                itemBuilder: (context, index) {
                  var collection = transactionCategory[index];

                  return ListTile(
                    title: Text(
                      collection.name,
                      style: TextStyle(
                        color: colorScheme.onBackground.withOpacity(.64),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_rounded),
                      onPressed: () => controller.deleteCategory(
                        collection: collection,
                      ),
                    ),
                  );
                },
                itemCount: transactionCategory.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              controller.transactionService.incomeTransactionCategories,
            ),

            // todo: spent
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 8,
              ),
              child: Text(
                'Spent',
                style: TextStyle(
                  color: colorScheme.onBackground,
                  fontSize: textTheme.titleMedium!.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ObxValue(
              (transactionCategory) => ListView.builder(
                itemBuilder: (context, index) {
                  var collection = transactionCategory[index];

                  return ListTile(
                    title: Text(
                      collection.name,
                      style: TextStyle(
                        color: colorScheme.onBackground.withOpacity(.64),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_rounded),
                      onPressed: () => controller.deleteCategory(
                        collection: collection,
                      ),
                    ),
                  );
                },
                itemCount: transactionCategory.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              controller.transactionService.spentTransactionCategories,
            ),
          ],
        ),
      ),
    );
  }
}
