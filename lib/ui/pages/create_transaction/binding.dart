import 'package:get/get.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/repositories/transaction.dart';
import 'package:work_it/ui/pages/create_transaction/controller.dart';

class CreateTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IsarProvider());

    Get.put(TransactionRepository(
      isarProvider: Get.find(),
    ));

    Get.put(CreateTransactionController(
      transactionService: Get.find(),
      transactionRepository: Get.find(),
    ));
  }
}
