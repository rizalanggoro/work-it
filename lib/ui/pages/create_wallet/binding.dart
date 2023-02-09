import 'package:get/get.dart';
import 'package:work_it/ui/pages/create_wallet/controller.dart';

class CreateWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateWalletController());
  }
}
