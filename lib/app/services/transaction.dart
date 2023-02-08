import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:work_it/data/collections/transaction.dart';
import 'package:work_it/data/collections/transaction_category.dart';
import 'package:work_it/data/repositories/transaction.dart';
import 'package:work_it/data/repositories/transaction_category.dart';

class TransactionService extends GetxService {
  final TransactionRepository transactionRepository;
  final TransactionCategoryRepository transactionCategoryRepository;

  TransactionService({
    required this.transactionRepository,
    required this.transactionCategoryRepository,
  });

  // todo: transaction
  final RxList<TransactionCollection> transaction = RxList([]);
  final RxMap<String, List<TransactionCollection>> mapTransaction = RxMap({});

  // todo: transaction category
  final RxList<TransactionCategoryCollection> incomeTransactionCategory =
      RxList([]);
  final RxList<TransactionCategoryCollection> spentTransactionCategory =
      RxList([]);

  @override
  void onReady() {
    super.onReady();

    _read();
    _listen();
  }

  void _read() async {
    transaction.value = await transactionRepository.readAll();
    mapTransaction.value = groupBy(
      transaction,
      (collection) {
        var transactionDate = DateTime.fromMillisecondsSinceEpoch(
          collection.date,
        );

        var groupDate = DateTime(
          transactionDate.year,
          transactionDate.month,
          transactionDate.day,
        );

        return groupDate.toIso8601String();
      },
    );

    incomeTransactionCategory.value =
        await transactionCategoryRepository.readIncome();
    spentTransactionCategory.value =
        await transactionCategoryRepository.readSpent();
  }

  void _listen() {
    transactionRepository.stream().listen((event) {
      transaction.value = event;
      mapTransaction.value = groupBy(
        event,
        (collection) {
          var transactionDate =
              DateTime.fromMillisecondsSinceEpoch(collection.date);
          var groupDate = DateTime(
            transactionDate.year,
            transactionDate.month,
            transactionDate.day,
          );

          return groupDate.toIso8601String();
        },
      );
    });

    transactionCategoryRepository
        .streamIncome()
        .listen((event) => incomeTransactionCategory.value = event);
    transactionCategoryRepository
        .streamSpent()
        .listen((event) => spentTransactionCategory.value = event);
  }
}
