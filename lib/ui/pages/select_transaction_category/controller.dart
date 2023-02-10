import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/transaction.dart';
import 'package:work_it/data/collections/transaction_category.dart';
import 'package:work_it/data/enums/transaction_type.dart';

class SelectTransactionCategoryController extends GetxController {
  final TransactionService transactionService;

  SelectTransactionCategoryController({
    required this.transactionService,
  });

  final RxInt selectedTransactionType = RxInt(0);
  final Rx<TransactionCategoryCollection?> selectedTransactionCategory =
      Rx(null);

  @override
  void onInit() {
    super.onInit();

    var arguments = Get.arguments;
    if (arguments != null) {
      selectedTransactionCategory.value =
          arguments as TransactionCategoryCollection;

      if (selectedTransactionCategory.value?.transactionType ==
          TransactionType.income) {
        selectedTransactionType.value = 0;
      } else {
        selectedTransactionType.value = 1;
      }
    }
  }

  void changeTransactionType(int index) =>
      selectedTransactionType.value = index;

  void changeTransactionCategory({
    required TransactionCategoryCollection collection,
  }) {
    selectedTransactionCategory.value = collection;
    Get.back(
      result: selectedTransactionCategory.value,
    );
  }

  void toManageTransactionCategory() =>
      Get.toNamed(Routes.manageTransactionCategory);
}
