import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:work_it/data/collections/wallet.dart';
import 'package:work_it/data/repositories/wallet.dart';

class CreateWalletController extends GetxController {
  final WalletRepository walletRepository;

  CreateWalletController({
    required this.walletRepository,
  });

  final TextEditingController controllerName = TextEditingController(),
      controllerAmount = TextEditingController();

  void create() async {
    var name = controllerName.text;
    var amount = controllerAmount.text;

    if (name.isNotEmpty) {
      var initialAmount = double.parse(
        amount.isNotEmpty ? amount : '0',
      );

      var collection = WalletCollection(
        name: name,
        initialAmount: initialAmount,
      );

      var result = await walletRepository.create(collection: collection);
      if (result.success) {
        Get.back();
      }
    }
  }
}
