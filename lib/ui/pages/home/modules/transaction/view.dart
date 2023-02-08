import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:work_it/data/collections/transaction.dart';
import 'package:work_it/data/enums/transaction_type.dart';
import 'package:work_it/ui/pages/home/modules/transaction/controller.dart';

class HomeTransactionView extends GetView<HomeTransactionController> {
  const HomeTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = context.theme.colorScheme;
    var textTheme = context.textTheme;

    return Scaffold(
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
                  itemBuilder: (context, index) => groupedListView(
                    index: index,
                    context: context,
                    key: listKeys[index],
                    value: mapTransaction[listKeys[index]],
                  ),
                  itemCount: listKeys.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                );
              },
              controller.transactionService.mapTransaction,
            ),
            // ObxValue(
            //   (transaction) => ListView.builder(
            //     itemBuilder: (context, index) {
            //       var collection = transaction[index];
            //
            //       collection.category.loadSync();
            //       var categoryCollection = collection.category.value;
            //       var type = categoryCollection?.transactionType;
            //
            //       return ListTile(
            //         onTap: () {},
            //         leading: CircleAvatar(
            //           child: Icon(
            //             type == null
            //                 ? Icons.remove_rounded
            //                 : (type == TransactionType.income
            //                     ? Icons.south_west_rounded
            //                     : Icons.north_east_rounded),
            //           ),
            //         ),
            //         title: Text(
            //           categoryCollection?.name ?? 'No category',
            //         ),
            //         subtitle: Text(
            //           DateFormat('EE, d MMM yyyy').format(
            //             DateTime.fromMillisecondsSinceEpoch(collection.date),
            //           ),
            //         ),
            //         trailing: Text(
            //           NumberFormat.currency(locale: 'id').format(
            //             collection.amount,
            //           ),
            //           style: TextStyle(
            //             color: type == null
            //                 ? colorScheme.onBackground.withOpacity(.64)
            //                 : (type == TransactionType.income
            //                     ? colorScheme.primary
            //                     : colorScheme.error),
            //           ),
            //         ),
            //       );
            //     },
            //     itemCount: transaction.length,
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //   ),
            //   controller.transactionService.transaction,
            // ),
          ],
        ),
      ),
    );
  }

  Widget groupedListView({
    required int index,
    required BuildContext context,
    required String key,
    List<TransactionCollection>? value,
  }) {
    var colorScheme = context.theme.colorScheme;
    var textTheme = context.textTheme;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // todo: date
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: index > 0 ? 24 : 0,
              bottom: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    DateFormat('EE, d MMM yyyy').format(
                      DateTime.parse(key),
                    ),
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: textTheme.titleMedium!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (value != null)
                  Text(
                    NumberFormat.currency(locale: 'id').format(
                      value
                          .map((e) {
                            e.category.loadSync();
                            var categoryColl = e.category.value;
                            var type = categoryColl?.transactionType;

                            var multiplier = 0;
                            if (type != null) {
                              multiplier =
                                  type == TransactionType.income ? 1 : -1;
                            }

                            return e.amount * multiplier;
                          })
                          .toList()
                          .sum,
                    ),
                    style: TextStyle(
                      color: colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),

          if (value != null)
            ListView.builder(
              itemBuilder: (context, index) {
                var collection = value[index];

                collection.category.loadSync();
                var categoryCollection = collection.category.value;

                var transactionNull =
                    categoryCollection?.transactionType == null;
                var transactionIncome = (transactionNull != true) &&
                    categoryCollection?.transactionType ==
                        TransactionType.income;

                return ListTile(
                  onLongPress: () => controller.deleteTransaction(
                    collection: collection,
                  ),
                  leading: CircleAvatar(
                    child: Icon(
                      transactionNull
                          ? Icons.remove_rounded
                          : (transactionIncome
                              ? Icons.south_west_rounded
                              : Icons.north_east_rounded),
                    ),
                  ),
                  title: Text(
                    categoryCollection?.name ?? 'No category',
                    style: TextStyle(
                      color: colorScheme.onBackground,
                    ),
                  ),
                  subtitle: Text(
                    collection.note,
                    maxLines: 2,
                    style: TextStyle(
                      color: colorScheme.onBackground.withOpacity(.64),
                    ),
                  ),
                  trailing: Text(
                    NumberFormat.currency(locale: 'id').format(
                      collection.amount,
                    ),
                    style: TextStyle(
                      fontSize: textTheme.bodySmall!.fontSize,
                      color: transactionNull
                          ? colorScheme.onBackground.withOpacity(.64)
                          : (transactionIncome
                              ? colorScheme.primary
                              : colorScheme.error),
                    ),
                  ),
                );
              },
              itemCount: value.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
        ],
      ),
    );
  }
}
