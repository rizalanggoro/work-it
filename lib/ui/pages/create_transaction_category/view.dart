import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/create_transaction_category/controller.dart';
import 'package:work_it/ui/widgets/conditional_widget.dart';

class CreateTransactionCategoryView
    extends GetView<CreateTransactionCategoryController> {
  const CreateTransactionCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = context.theme.colorScheme;
    var textTheme = context.textTheme;

    var transactionTypes = ['Income', 'Spent'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Category'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // todo: error container
            ObxValue(
              (errorMessage) => ConditionalWidget(
                body: Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.errorContainer,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_rounded,
                        color: colorScheme.error,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Error!',
                              style: TextStyle(
                                color: colorScheme.onErrorContainer,
                                fontSize: textTheme.bodyLarge!.fontSize,
                              ),
                            ),
                            Text(
                              errorMessage.value,
                              style: TextStyle(
                                color: colorScheme.onErrorContainer
                                    .withOpacity(.64),
                                fontSize: textTheme.bodyMedium!.fontSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                showIf: errorMessage.isNotEmpty,
              ),
              controller.errorMessage,
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: TextField(
                controller: controller.controllerName,
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Name'),
                ),
              ),
            ),

            // todo: transaction type
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 8,
              ),
              child: Text(
                'Transaction type',
                style: TextStyle(
                  color: colorScheme.onBackground,
                  fontSize: textTheme.titleMedium!.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => controller.changeTransactionType(index),
                  leading: ObxValue(
                    (transactionTypeIndex) {
                      var isSelected = transactionTypeIndex.value == index;

                      return Icon(
                        isSelected
                            ? Icons.radio_button_on_rounded
                            : Icons.radio_button_off_rounded,
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.secondary,
                      );
                    },
                    controller.transactionTypeIndex,
                  ),
                  title: Text(
                    transactionTypes[index],
                    style: TextStyle(
                      color: colorScheme.onBackground.withOpacity(.64),
                    ),
                  ),
                );
              },
              itemCount: transactionTypes.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),

            // todo: button submit
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: ElevatedButton(
                child: const Text('Create'),
                onPressed: () => controller.create(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
