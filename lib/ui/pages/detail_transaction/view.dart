import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:work_it/ui/pages/detail_transaction/controller.dart';
import 'package:work_it/ui/utils/ui_utils.dart';

class DetailTransactionView extends GetView<DetailTransactionController> {
  const DetailTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = context.theme.colorScheme;
    var textTheme = context.textTheme;

    return Scaffold(
      backgroundColor: UIUtils.backgroundColor(context),
      appBar: AppBar(
        backgroundColor: UIUtils.backgroundColor(context),
        title: const Text('Detail transaction'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.attach_money_rounded),
              ),
              title: Text(
                'Amount',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                NumberFormat.currency(locale: 'id').format(
                  controller.collection.amount,
                ),
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
            ),

            // todo: category
            if (controller.categoryCollection != null)
              ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    controller.isIncome
                        ? Icons.south_west_rounded
                        : Icons.north_east_rounded,
                  ),
                ),
                title: Text(
                  'Category',
                  style: TextStyle(
                    color: colorScheme.onBackground,
                  ),
                ),
                subtitle: Text(
                  controller.categoryCollection!.name,
                  style: TextStyle(
                    color: colorScheme.onBackground.withOpacity(.64),
                  ),
                ),
              ),

            // todo: date
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.today_rounded),
              ),
              title: Text(
                'Date',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                DateFormat('EEE, d MMM yyyy').format(
                  DateTime.fromMillisecondsSinceEpoch(
                    controller.collection.date,
                  ),
                ),
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
            ),

            // todo: note
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Text(
                'Note',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: textTheme.titleMedium!.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
              ),
              child: Text(
                controller.collection.note,
                style: TextStyle(
                  color: colorScheme.onBackground.withOpacity(.64),
                  fontSize: textTheme.bodyMedium!.fontSize,
                ),
              ),
            ),

            // todo: actions
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: ElevatedButton(
                onPressed: () => controller.deleteTransaction(),
                child: const Text('Delete'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
