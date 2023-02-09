import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:work_it/app/services/transaction.dart';
import 'package:work_it/app/services/wallet.dart';
import 'package:work_it/data/collections/transaction.dart';
import 'package:work_it/data/collections/transaction_category.dart';
import 'package:work_it/data/collections/wallet.dart';
import 'package:work_it/data/repositories/transaction.dart';

class CreateTransactionController extends GetxController {
  final TransactionService transactionService;
  final WalletService walletService;
  final TransactionRepository transactionRepository;

  CreateTransactionController({
    required this.transactionService,
    required this.walletService,
    required this.transactionRepository,
  });

  final TextEditingController controllerAmount = TextEditingController(),
      controllerNote = TextEditingController();

  final Rx<TransactionCategoryCollection?> transactionCategory = Rx(null);
  final Rx<DateTime> transactionDate = Rx(DateTime.now());
  final Rx<WalletCollection?> wallet = Rx(null);

  void changeTransactionCategory({
    required TransactionCategoryCollection collection,
  }) {
    transactionCategory.value = collection;
    Get.back();
  }

  void changeTransactionDate({
    required DateTime date,
  }) =>
      transactionDate.value = date;

  void changeWallet({
    required WalletCollection collection,
  }) {
    wallet.value = collection;
    Get.back();
  }

  void create() async {
    var amount = controllerAmount.text;
    var note = controllerNote.text;

    var collection = TransactionCollection(
      amount: double.parse(amount),
      note: note,
      date: transactionDate.value.millisecondsSinceEpoch,
    );
    collection.category.value = transactionCategory.value;

    var result = await transactionRepository.create(
      collection: collection,
    );

    if (result.success) {
      Get.back();
    }
  }
}
