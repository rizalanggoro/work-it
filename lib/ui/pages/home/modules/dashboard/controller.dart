import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/transaction.dart';

class HomeDashboardController extends GetxController {
  final TransactionService transactionService;

  HomeDashboardController({
    required this.transactionService,
  });

  void toCreateTransaction() => Get.toNamed(Routes.createTransaction);
}
