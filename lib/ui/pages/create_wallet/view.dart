import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/create_wallet/controller.dart';

class CreateWalletView extends GetView<CreateWalletController> {
  const CreateWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = context.theme.colorScheme;
    var textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create wallet'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                right: 16,
                left: 16,
              ),
              child: TextField(
                controller: controller.controllerName,
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Name'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                right: 16,
                left: 16,
              ),
              child: TextField(
                controller: controller.controllerAmount,
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Initial amount'),
                ),
              ),
            ),

            // todo: button submit
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: ElevatedButton(
                child: const Text('Create'),
                onPressed: () => controller.create(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
