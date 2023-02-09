import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:work_it/data/enums/transaction_type.dart';
import 'package:work_it/ui/pages/home/modules/dashboard/controller.dart';

class HomeDashboardTodayTransaction extends GetView<HomeDashboardController> {
  const HomeDashboardTodayTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    final strToday = DateFormat('EEEE, d MMMM yyyy').format(DateTime.now());

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
            ),
            child: Text(
              'Today\'s transaction',
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: textTheme.titleMedium!.fontSize,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 4,
              bottom: 16,
            ),
            child: Text(
              'Here are some transactions you made on $strToday',
              style: TextStyle(
                color: colorScheme.onBackground.withOpacity(.64),
              ),
            ),
          ),

          // todo: list transaction
          ObxValue(
            (todayTransactions) => ListView.builder(
              itemBuilder: (context, index) {
                final collection = todayTransactions[index];

                collection.category.loadSync();
                final categoryCollection = collection.category.value;

                final type = categoryCollection?.transactionType;
                final typeNull = type == null;
                final typeIncome = !typeNull && type == TransactionType.income;

                return ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    child: Icon(
                      typeNull
                          ? Icons.remove_rounded
                          : (typeIncome
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
                    style: TextStyle(
                      color: colorScheme.onBackground.withOpacity(.64),
                    ),
                  ),
                  trailing: Text(
                    NumberFormat.currency(locale: 'id').format(
                      collection.amount,
                    ),
                    style: TextStyle(
                      color: typeNull
                          ? colorScheme.onBackground.withOpacity(.64)
                          : (typeIncome
                              ? colorScheme.primary
                              : colorScheme.error),
                      fontSize: textTheme.bodySmall!.fontSize,
                    ),
                  ),
                );
              },
              itemCount: todayTransactions.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
            controller.transactionService.todayTransactions,
          ),

          // todo: button create new transaction
          Container(
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add_rounded),
              label: const Text('Create a new transaction'),
              onPressed: () => controller.toCreateTransaction(),
            ),
          ),
        ],
      ),
    );
  }
}
