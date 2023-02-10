import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/transaction/controller.dart';

class HomeTransactionFilterWidget extends GetView<HomeTransactionController> {
  const HomeTransactionFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Card(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              'February 2023',
              style: TextStyle(
                color: colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
