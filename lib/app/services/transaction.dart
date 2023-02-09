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
  final RxList<TransactionCollection> transactions = RxList([]);
  final RxList<TransactionCollection> todayTransactions = RxList([]);
  final RxMap<String, List<TransactionCollection>> mapTransactions = RxMap({});

  // todo: transaction category
  final RxList<TransactionCategoryCollection> incomeTransactionCategories =
      RxList([]);
  final RxList<TransactionCategoryCollection> spentTransactionCategories =
      RxList([]);

  @override
  void onReady() {
    super.onReady();

    _read();
    _listen();
  }

  void _read() async {
    transactions.value = await transactionRepository.readAll();
    todayTransactions.value = await transactionRepository.readAllToday();
    mapTransactions.value = groupBy(
      transactions,
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

    incomeTransactionCategories.value =
        await transactionCategoryRepository.readIncome();
    spentTransactionCategories.value =
        await transactionCategoryRepository.readSpent();
  }

  void _listen() {
    transactionRepository.stream().listen((event) {
      transactions.value = event;
      mapTransactions.value = groupBy(
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

    // todo: today's transaction
    transactionRepository
        .streamToday()
        .listen((event) => todayTransactions.value = event);

    transactionCategoryRepository
        .streamIncome()
        .listen((event) => incomeTransactionCategories.value = event);
    transactionCategoryRepository
        .streamSpent()
        .listen((event) => spentTransactionCategories.value = event);
  }
}
