import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/wallet.dart';
import 'package:work_it/data/collections/wallet.dart';
import 'package:work_it/data/repositories/wallet.dart';

class ManageWalletController extends GetxController {
  final WalletService walletService;
  final WalletRepository walletRepository;

  ManageWalletController({
    required this.walletService,
    required this.walletRepository,
  });

  void toCreateWallet() => Get.toNamed(Routes.createWallet);

  void deleteWallet({
    required WalletCollection collection,
  }) async {
    var result = await walletRepository.deleteById(
      id: collection.id,
    );

    print(result.success);
  }
}
