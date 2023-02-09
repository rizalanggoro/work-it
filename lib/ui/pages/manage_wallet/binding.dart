import 'package:get/get.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/repositories/wallet.dart';
import 'package:work_it/ui/pages/manage_wallet/controller.dart';

class ManageWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IsarProvider());

    Get.put(WalletRepository(
      isarProvider: Get.find(),
    ));

    Get.put(ManageWalletController(
      walletRepository: Get.find(),
      walletService: Get.find(),
    ));
  }
}
