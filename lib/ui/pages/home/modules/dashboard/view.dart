import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/dashboard/controller.dart';

class HomeDashboardView extends GetView<HomeDashboardController> {
  const HomeDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = context.textTheme;
    var colorScheme = context.theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
