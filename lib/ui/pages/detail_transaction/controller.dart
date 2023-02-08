import 'package:get/get.dart';
import 'package:work_it/data/collections/transaction.dart';
import 'package:work_it/data/collections/transaction_category.dart';
import 'package:work_it/data/enums/transaction_type.dart';
import 'package:work_it/data/repositories/transaction.dart';

class DetailTransactionController extends GetxController {
  final TransactionRepository transactionRepository;

  DetailTransactionController({
    required this.transactionRepository,
  });

  late final TransactionCollection collection;
  TransactionCategoryCollection? categoryCollection;

  @override
  void onInit() {
    super.onInit();

    var args = Get.arguments;
    var collection = args['collection'];
    if (collection == null) {
      Get.back();
      return;
    } else {
      this.collection = collection as TransactionCollection;
      this.collection.category.loadSync();
      categoryCollection = this.collection.category.value;
    }
  }

  // todo: if category collection != null
  bool get isIncome =>
      categoryCollection?.transactionType == TransactionType.income;

  void deleteTransaction() async {
    var result = await transactionRepository.deleteById(
      id: collection.id,
    );

    if (result.success) {
      Get.back();
    }
  }
}
