import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/transaction.dart';
import 'package:work_it/data/collections/transaction.dart';
import 'package:work_it/data/repositories/transaction.dart';

class HomeTransactionController extends GetxController {
  final TransactionService transactionService;

  final TransactionRepository transactionRepository;

  HomeTransactionController({
    required this.transactionService,
    required this.transactionRepository,
  });

  void toCreateTransaction() => Get.toNamed(Routes.createTransaction);

  void deleteTransaction({
    required TransactionCollection collection,
  }) async {
    var result = await transactionRepository.deleteById(
      id: collection.id,
    );
  }
}
