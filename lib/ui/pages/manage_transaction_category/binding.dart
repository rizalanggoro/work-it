import 'package:get/get.dart';
import 'package:work_it/data/repositories/transaction_category.dart';
import 'package:work_it/ui/pages/manage_transaction_category/controller.dart';

class ManageTransactionCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TransactionCategoryRepository(
      isarProvider: Get.find(),
    ));

    Get.put(ManageTransactionCategoryController(
      transactionCategoryProvider: Get.find(),
      transactionService: Get.find(),
    ));
  }
}
