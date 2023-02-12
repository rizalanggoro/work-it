import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/manage_wallet/controller.dart';
import 'package:work_it/ui/utils/ui_utils.dart';

class ManageWalletView extends GetView<ManageWalletController> {
  const ManageWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = context.theme.colorScheme;
    var textTheme = context.textTheme;

    return Scaffold(
      backgroundColor: UIUtils.backgroundColor(context),
      appBar: AppBar(
        backgroundColor: UIUtils.backgroundColor(context),
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
                    subtitle: Text(
                      'ID: ${collection.id.toString()}',
                      style: TextStyle(
                        color: colorScheme.onBackground.withOpacity(.64),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_rounded),
                      onPressed: () => controller.deleteWallet(
                        collection: collection,
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
