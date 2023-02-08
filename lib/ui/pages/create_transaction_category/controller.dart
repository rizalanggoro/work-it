import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:work_it/data/collections/transaction_category.dart';
import 'package:work_it/data/enums/transaction_type.dart';
import 'package:work_it/data/repositories/transaction_category.dart';

class CreateTransactionCategoryController extends GetxController {
  final TransactionCategoryRepository transactionCategoryProvider;

  CreateTransactionCategoryController({
    required this.transactionCategoryProvider,
  });

  final TextEditingController controllerName = TextEditingController();
  final RxInt transactionTypeIndex = RxInt(0);

  final RxString errorMessage = RxString('');

  void changeTransactionType(int index) => transactionTypeIndex.value = index;

  void create() async {
    errorMessage.value = '';

    var name = controllerName.text;
    var type = TransactionType.values[transactionTypeIndex.value];

    var collection = TransactionCategoryCollection(
      name: name,
      transactionType: type,
    );

    var result = await transactionCategoryProvider.create(
      collection: collection,
    );

    if (result.success) {
      Get.back();
    } else {
      errorMessage.value = result.message ?? 'No error message';
    }
  }
}
