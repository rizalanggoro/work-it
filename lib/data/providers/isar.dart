import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:work_it/data/collections/task_category.dart';
import 'package:work_it/data/collections/transaction.dart';
import 'package:work_it/data/collections/transaction_category.dart';
import 'package:work_it/data/collections/wallet.dart';

class IsarProvider extends GetxService {
  @override
  void onReady() {
    super.onReady();

    openIsarInstance();
  }

  Future<Isar> openIsarInstance() async {
    return Isar.getInstance() ??
        await Isar.open([
          TransactionCategoryCollectionSchema,
          TransactionCollectionSchema,
          WalletCollectionSchema,
          TaskCategoryCollectionSchema,
        ]);
  }
}
