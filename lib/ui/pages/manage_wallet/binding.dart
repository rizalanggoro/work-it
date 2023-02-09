import 'package:get/get.dart';
import 'package:work_it/ui/pages/manage_wallet/controller.dart';

class ManageWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ManageWalletController());
  }
}
