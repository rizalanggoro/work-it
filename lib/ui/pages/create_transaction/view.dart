import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:work_it/ui/pages/create_transaction/controller.dart';

class CreateTransactionView extends GetView<CreateTransactionController> {
  const CreateTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = context.theme.colorScheme;
    var textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Transaction'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // todo: amount
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: TextField(
                controller: controller.controllerAmount,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Amount'),
                ),
              ),
            ),

            // todo: note
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 16,
              ),
              child: TextField(
                controller: controller.controllerNote,
                maxLines: null,
                minLines: 3,
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Note'),
                  alignLabelWithHint: true,
                ),
              ),
            ),

            // todo: category
            ListTile(
              onTap: () => _showBottomSheetSelectTransactionCategory(context),
              leading: const CircleAvatar(
                child: Icon(Icons.category_rounded),
              ),
              title: Text(
                'Category',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: ObxValue(
                (transactionCategory) => Text(
                  transactionCategory.value?.name ?? 'No category selected',
                  style: TextStyle(
                    color: colorScheme.onBackground.withOpacity(.64),
                  ),
                ),
                controller.transactionCategory,
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
            ),

            // todo: date
            ListTile(
              onTap: () => _showDatePicker(context),
              leading: const CircleAvatar(
                child: Icon(Icons.today_rounded),
              ),
              title: Text(
                'Date',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: ObxValue(
                (transactionDate) => Text(
                  DateFormat('EE, d MMM yyyy').format(
                    transactionDate.value,
                  ),
                  style: TextStyle(
                    color: colorScheme.onBackground.withOpacity(.64),
                  ),
                ),
                controller.transactionDate,
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
            ),

            // todo: wallet
            ListTile(
              onTap: () => _showBottomSheetSelectWallet(context),
              leading: const CircleAvatar(
                child: Icon(Icons.wallet_rounded),
              ),
              title: Text(
                'Wallet',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: ObxValue(
                (wallet) => Text(
                  wallet.value?.name ?? 'No wallet selected',
                  style: TextStyle(
                    color: colorScheme.onBackground.withOpacity(.64),
                  ),
                ),
                controller.wallet,
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
            ),

            // todo: button submit
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
                bottom: 24,
              ),
              child: ElevatedButton(
                onPressed: () => controller.create(),
                child: const Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheetSelectWallet(BuildContext context) {
    var textTheme = context.textTheme;
    var colorScheme = context.theme.colorScheme;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Select wallet',
                  style: TextStyle(
                    color: colorScheme.onBackground,
                    fontSize: textTheme.titleLarge!.fontSize,
                  ),
                ),
              ),

              // todo: list wallet
              ObxValue(
                (wallets) => ListView.builder(
                  itemBuilder: (context, index) {
                    var collection = wallets[index];
                    var isSelected =
                        controller.wallet.value?.id == collection.id;

                    return ListTile(
                      onTap: () => controller.changeWallet(
                        collection: collection,
                      ),
                      leading: Icon(
                        isSelected
                            ? Icons.radio_button_on_rounded
                            : Icons.radio_button_off_rounded,
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.secondary,
                      ),
                      title: Text(
                        collection.name,
                        style: TextStyle(
                          color: colorScheme.onBackground,
                        ),
                      ),
                    );
                  },
                  itemCount: wallets.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                controller.walletService.wallets,
              ),

              // todo: spacer
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _showDatePicker(BuildContext context) async {
    var currentDate = controller.transactionDate.value;
    var firstDate = DateTime(currentDate.year - 1);
    var lastDate = DateTime(currentDate.year + 1);

    var result = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (result != null) {
      controller.changeTransactionDate(date: result);
    }
  }

  void _showBottomSheetSelectTransactionCategory(BuildContext context) {
    var colorScheme = context.theme.colorScheme;
    var textTheme = context.textTheme;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Select category',
                  style: TextStyle(
                    color: colorScheme.onBackground,
                    fontSize: textTheme.titleLarge!.fontSize,
                  ),
                ),
              ),

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
                  ),
                ),
              ),
              ObxValue(
                (incomeTransactionCategory) => ListView.builder(
                  itemBuilder: (context, index) {
                    var collection = incomeTransactionCategory[index];
                    var isSelected = collection.id ==
                        controller.transactionCategory.value?.id;

                    return ListTile(
                      onTap: () => controller.changeTransactionCategory(
                        collection: collection,
                      ),
                      leading: Icon(
                        isSelected
                            ? Icons.radio_button_on_rounded
                            : Icons.radio_button_off_rounded,
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.secondary,
                      ),
                      title: Text(
                        collection.name,
                        style: TextStyle(
                          color: colorScheme.onBackground.withOpacity(.64),
                        ),
                      ),
                    );
                  },
                  itemCount: incomeTransactionCategory.length,
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
                  ),
                ),
              ),
              ObxValue(
                (spentTransactionCategory) => ListView.builder(
                  itemBuilder: (context, index) {
                    var collection = spentTransactionCategory[index];
                    var isSelected = collection.id ==
                        controller.transactionCategory.value?.id;

                    return ListTile(
                      onTap: () => controller.changeTransactionCategory(
                        collection: collection,
                      ),
                      leading: Icon(
                        isSelected
                            ? Icons.radio_button_on_rounded
                            : Icons.radio_button_off_rounded,
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.secondary,
                      ),
                      title: Text(
                        collection.name,
                        style: TextStyle(
                          color: colorScheme.onBackground.withOpacity(.64),
                        ),
                      ),
                    );
                  },
                  itemCount: spentTransactionCategory.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                controller.transactionService.spentTransactionCategories,
              ),

              // todo: spacer
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
