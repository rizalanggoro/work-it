import 'package:get/get.dart';
import 'package:work_it/ui/pages/select_transaction_category/controller.dart';

class SelectTransactionCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectTransactionCategoryController(
      transactionService: Get.find(),
    ));
  }
}
