import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/profile/controller.dart';

class HomeProfileView extends GetView<HomeProfileController> {
  const HomeProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = context.textTheme;
    var colorScheme = context.theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // todo: app setting
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 8,
              ),
              child: Text(
                'App Configurations',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: textTheme.titleMedium!.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () => controller.switchBrightness(),
              title: Text(
                'Dark theme',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              trailing: ObxValue(
                (darkMode) => Switch(
                  value: darkMode.value,
                  onChanged: (value) => controller.switchBrightness(),
                ),
                controller.themeService.darkMode,
              ),
            ),

            // todo: transaction
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 8,
              ),
              child: Text(
                'Transaction',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: textTheme.titleMedium!.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () => controller.toManageTransactionCategory(),
              leading: const CircleAvatar(
                child: Icon(
                  Icons.category_rounded,
                ),
              ),
              title: Text(
                'Manage category',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Create, update, delete transaction category',
                style: TextStyle(
                  color: colorScheme.onBackground.withOpacity(.64),
                ),
              ),
              trailing: const Icon(
                Icons.chevron_right_rounded,
              ),
            ),
            ListTile(
              onTap: () => controller.toManageWallet(),
              leading: const CircleAvatar(
                child: Icon(
                  Icons.wallet_rounded,
                ),
              ),
              title: Text(
                'Manage wallet',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Create, update, delete wallet',
                style: TextStyle(
                  color: colorScheme.onBackground.withOpacity(.64),
                ),
              ),
              trailing: const Icon(
                Icons.chevron_right_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
