import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/manage_wallet/controller.dart';

class ManageWalletView extends GetView<ManageWalletController> {
  const ManageWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = context.theme.colorScheme;
    var textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () => controller.toCreateWallet(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ObxValue(
              (wallets) => ListView.builder(
                itemBuilder: (context, index) {
                  var collection = wallets[index];

                  return ListTile(
                    title: Text(
                      collection.name,
                      style: TextStyle(
                        color: colorScheme.onBackground,
                      ),
                    ),
                  );
                },
                itemCount: wallets.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              controller.walletService.wallets,
            ),
          ],
        ),
      ),
    );
  }
}
