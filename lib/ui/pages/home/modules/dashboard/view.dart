import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/dashboard/controller.dart';
import 'package:work_it/ui/pages/home/modules/dashboard/widgets/today_transaction.dart';
import 'package:work_it/ui/utils/ui_utils.dart';

class HomeDashboardView extends GetView<HomeDashboardController> {
  const HomeDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = context.textTheme;
    var colorScheme = context.theme.colorScheme;

    return Scaffold(
      backgroundColor: UIUtils.backgroundColor(context),
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: UIUtils.backgroundColor(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeDashboardTodayTransaction(),
          ],
        ),
      ),
    );
  }
}
