import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:work_it/data/collections/transaction.dart';
import 'package:work_it/data/enums/transaction_type.dart';
import 'package:work_it/ui/pages/home/modules/transaction/controller.dart';

class GroupedTransactionWidget extends GetView<HomeTransactionController> {
  final int index;
  final String transactionsKey;
  final List<TransactionCollection> transactions;

  const GroupedTransactionWidget({
    super.key,
    required this.index,
    required this.transactionsKey,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
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
                      DateTime.parse(transactionsKey),
                    ),
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: textTheme.titleMedium!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  NumberFormat.currency(locale: 'id').format(
                    transactions
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

          ListView.builder(
            itemBuilder: (context, index) {
              var collection = transactions[index];

              collection.category.loadSync();
              var categoryCollection = collection.category.value;

              var transactionNull = categoryCollection?.transactionType == null;
              var transactionIncome = (transactionNull != true) &&
                  categoryCollection?.transactionType == TransactionType.income;

              return ListTile(
                onLongPress: () => controller.deleteTransaction(
                  collection: collection,
                ),
                onTap: () => controller.toDetailTransaction(
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
            itemCount: transactions.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
