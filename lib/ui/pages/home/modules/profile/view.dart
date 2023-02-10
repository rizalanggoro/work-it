import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/profile/controller.dart';
import 'package:work_it/ui/pages/home/modules/profile/widgets/sections/task.dart';

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
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              onTap: () => controller.switchBrightness(),
              leading: const CircleAvatar(
                child: Icon(Icons.dark_mode_rounded),
              ),
              title: Text(
                'Dark theme',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Use dark mode for more eye-friendly conditions',
                style: TextStyle(
                  color: colorScheme.onBackground.withOpacity(.64),
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
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              onTap: () => controller.toCheckRelease(),
              leading: const CircleAvatar(
                child: Icon(Icons.update_rounded),
              ),
              title: Text(
                'Release',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Check the latest release from the github repository',
                style: TextStyle(
                  color: colorScheme.onBackground.withOpacity(.64),
                ),
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              onTap: () => controller.toSourceCode(),
              leading: const CircleAvatar(
                child: Icon(Icons.code_rounded),
              ),
              title: Text(
                'Source code',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'View WorkIt app source code on Github',
                style: TextStyle(
                  color: colorScheme.onBackground.withOpacity(.64),
                ),
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: const CircleAvatar(
                child: Icon(Icons.numbers_rounded),
              ),
              title: Text(
                'Version',
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
              ),
              subtitle: ObxValue(
                (version) => Text(
                  version.value,
                  style: TextStyle(
                    color: colorScheme.onBackground.withOpacity(.64),
                  ),
                ),
                controller.version,
              ),
            ),

            // todo: task
            const HomeProfileSectionTask(),

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
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
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
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
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
