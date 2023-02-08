import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/transaction.dart';
import 'package:work_it/data/collections/transaction_category.dart';
import 'package:work_it/data/repositories/transaction_category.dart';

class ManageTransactionCategoryController extends GetxController {
  final TransactionCategoryRepository transactionCategoryProvider;
  final TransactionService transactionService;

  ManageTransactionCategoryController({
    required this.transactionCategoryProvider,
    required this.transactionService,
  });

  void toCreateTransactionCategory() =>
      Get.toNamed(Routes.createTransactionCategory);

  void deleteCategory({
    required TransactionCategoryCollection collection,
  }) async =>
      await transactionCategoryProvider.deleteById(
        id: collection.id,
      );
}
