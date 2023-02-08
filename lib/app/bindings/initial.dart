import 'package:get/get.dart';
import 'package:work_it/app/services/theme.dart';
import 'package:work_it/app/services/transaction.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/repositories/transaction.dart';
import 'package:work_it/data/repositories/transaction_category.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IsarProvider(), permanent: true);

    Get.put(TransactionRepository(
      isarProvider: Get.find(),
    ));
    Get.put(TransactionCategoryRepository(
      isarProvider: Get.find(),
    ));

    Get.put(ThemeService(), permanent: true);
    Get.put(
      TransactionService(
        transactionRepository: Get.find(),
        transactionCategoryRepository: Get.find(),
      ),
      permanent: true,
    );
  }
}
