import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/wallet.dart';

class ManageWalletController extends GetxController {
  final WalletService walletService;

  ManageWalletController({
    required this.walletService,
  });

  void toCreateWallet() => Get.toNamed(Routes.createWallet);
}
