import 'package:get/get.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/repositories/transaction.dart';
import 'package:work_it/ui/pages/detail_transaction/controller.dart';

class DetailTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IsarProvider());

    Get.put(TransactionRepository(
      isarProvider: Get.find(),
    ));

    Get.put(DetailTransactionController(
      transactionRepository: Get.find(),
    ));
  }
}
