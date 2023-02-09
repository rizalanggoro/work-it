import 'package:get/get.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/repositories/wallet.dart';
import 'package:work_it/ui/pages/create_wallet/controller.dart';

class CreateWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IsarProvider());

    Get.put(WalletRepository(
      isarProvider: Get.find(),
    ));

    Get.put(CreateWalletController(
      walletRepository: Get.find(),
    ));
  }
}
