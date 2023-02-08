import 'package:isar/isar.dart';
import 'package:work_it/data/collections/transaction_category.dart';
import 'package:work_it/data/enums/transaction_type.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/results/transaction_category.dart';

class TransactionCategoryRepository {
  final _devName = 'TransactionCategoryProvider';

  final IsarProvider isarProvider;

  TransactionCategoryRepository({
    required this.isarProvider,
  });

  Future<TransactionCategoryResult> create({
    required TransactionCategoryCollection collection,
  }) async {
    String? message;
    var isar = await isarProvider.openIsarInstance();

    try {
      // todo: query
      var queryResult = await isar.transactionCategoryCollections
          .filter()
          .nameEqualTo(collection.name, caseSensitive: false)
          .and()
          .transactionTypeEqualTo(collection.transactionType)
          .findFirst();

      if (queryResult == null) {
        // todo: create new transaction category
        await isar.writeTxn(() async {
          await isar.transactionCategoryCollections.put(collection);
        });

        return TransactionCategoryResult(success: true);
      } else {
        message = 'Category has been added! Please use another name...';
      }
    } catch (_) {
      message = 'Something went wrong! Please try again later...';
    }

    return TransactionCategoryResult(
      success: false,
      message: message,
    );
  }

  Future<List<TransactionCategoryCollection>> read() async {
    var isar = await isarProvider.openIsarInstance();

    return await isar.transactionCategoryCollections.where().findAll();
  }

  Stream<List<TransactionCategoryCollection>> stream() async* {
    var isar = await isarProvider.openIsarInstance();
    yield* isar.transactionCategoryCollections.where().watch();
  }

  Future<bool> deleteById({
    required int id,
  }) async {
    var isar = await isarProvider.openIsarInstance();

    var result = await isar.writeTxn(() async {
      return await isar.transactionCategoryCollections.delete(id);
    });

    return result;
  }

  // todo: income
  Future<List<TransactionCategoryCollection>> readIncome() async {
    var isar = await isarProvider.openIsarInstance();

    return await isar.transactionCategoryCollections
        .where()
        .filter()
        .transactionTypeEqualTo(TransactionType.income)
        .sortByName()
        .findAll();
  }

  Stream<List<TransactionCategoryCollection>> streamIncome() async* {
    var isar = await isarProvider.openIsarInstance();
    yield* isar.transactionCategoryCollections
        .where()
        .filter()
        .transactionTypeEqualTo(TransactionType.income)
        .sortByName()
        .watch();
  }

  // todo: spent
  Future<List<TransactionCategoryCollection>> readSpent() async {
    var isar = await isarProvider.openIsarInstance();

    return await isar.transactionCategoryCollections
        .where()
        .filter()
        .transactionTypeEqualTo(TransactionType.spent)
        .sortByName()
        .findAll();
  }

  Stream<List<TransactionCategoryCollection>> streamSpent() async* {
    var isar = await isarProvider.openIsarInstance();
    yield* isar.transactionCategoryCollections
        .where()
        .filter()
        .transactionTypeEqualTo(TransactionType.spent)
        .sortByName()
        .watch();
  }
}
