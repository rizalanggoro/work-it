import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/transaction/controller.dart';
import 'package:work_it/ui/pages/home/modules/transaction/widgets/grouped_transaction.dart';

class HomeTransactionView extends GetView<HomeTransactionController> {
  const HomeTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = context.theme.colorScheme;
    var textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () => controller.toCreateTransaction(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ObxValue(
              (mapTransaction) {
                var listKeys = mapTransaction.keys.toList();
                listKeys.sort((a, b) => b.compareTo(a));

                return ListView.builder(
                  itemBuilder: (context, index) => GroupedTransactionWidget(
                    index: index,
                    transactionsKey: listKeys[index],
                    transactions: mapTransaction[listKeys[index]] ?? [],
                  ),
                  itemCount: listKeys.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                );
              },
              controller.transactionService.mapTransaction,
            ),
          ],
        ),
      ),
    );
  }
}
