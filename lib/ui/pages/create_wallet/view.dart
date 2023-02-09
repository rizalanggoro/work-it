import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/create_wallet/controller.dart';

class CreateWalletView extends GetView<CreateWalletController> {
  const CreateWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create wallet'),
      ),
    );
  }
}
