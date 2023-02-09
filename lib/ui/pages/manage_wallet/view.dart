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
    );
  }
}
