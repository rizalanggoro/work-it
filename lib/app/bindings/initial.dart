import 'package:get/get.dart';
import 'package:work_it/app/services/task.dart';
import 'package:work_it/app/services/theme.dart';
import 'package:work_it/app/services/transaction.dart';
import 'package:work_it/app/services/wallet.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/repositories/task_category.dart';
import 'package:work_it/data/repositories/transaction.dart';
import 'package:work_it/data/repositories/transaction_category.dart';
import 'package:work_it/data/repositories/wallet.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IsarProvider(), permanent: true);

    // todo: repositories
    // todo: -> transaction
    Get.put(TransactionRepository(
      isarProvider: Get.find(),
    ));
    Get.put(TransactionCategoryRepository(
      isarProvider: Get.find(),
    ));
    Get.put(WalletRepository(
      isarProvider: Get.find(),
    ));

    // todo: -> task
    Get.put(TaskCategoryRepository(
      isarProvider: Get.find(),
    ));

    // todo: services
    // todo: -> theme
    Get.put(ThemeService(), permanent: true);

    // todo: -> transaction
    Get.put(
      TransactionService(
        transactionRepository: Get.find(),
        transactionCategoryRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put(
      WalletService(
        walletRepository: Get.find(),
      ),
      permanent: true,
    );

    // todo: -> task
    Get.put(
      TaskService(
        taskCategoryRepository: Get.find(),
      ),
      permanent: true,
    );
  }
}
