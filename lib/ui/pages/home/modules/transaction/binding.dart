import 'package:get/get.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/repositories/transaction.dart';
import 'package:work_it/ui/pages/home/modules/transaction/controller.dart';

class HomeTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IsarProvider());

    Get.put(TransactionRepository(
      isarProvider: Get.find(),
    ));

    Get.put(HomeTransactionController(
      transactionRepository: Get.find(),
      transactionService: Get.find(),
    ));
  }
}
