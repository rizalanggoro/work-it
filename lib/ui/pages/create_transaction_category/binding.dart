import 'package:get/get.dart';
import 'package:work_it/data/repositories/transaction_category.dart';
import 'package:work_it/ui/pages/create_transaction_category/controller.dart';

class CreateTransactionCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TransactionCategoryRepository(
      isarProvider: Get.find(),
    ));

    Get.put(CreateTransactionCategoryController(
      transactionCategoryProvider: Get.find(),
    ));
  }
}
