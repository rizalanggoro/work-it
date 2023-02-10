import 'dart:developer' as dev;

import 'package:isar/isar.dart';
import 'package:work_it/data/collections/transaction.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/results/transaction.dart';

class TransactionRepository {
  final _devName = 'TransactionRepository';

  final IsarProvider isarProvider;

  TransactionRepository({
    required this.isarProvider,
  });

  Future<TransactionResult> create({
    required TransactionCollection collection,
  }) async {
    String? message;
    var isar = await isarProvider.openIsarInstance();

    try {
      await isar.writeTxn(() async {
        await isar.transactionCollections.put(collection);
        await collection.category.save();
        await collection.wallet.save();
      });

      return TransactionResult(success: true);
    } catch (error) {
      message = 'Something went wrong! Please try again later...';

      dev.log(error.toString(), name: _devName);
    }

    return TransactionResult(
      success: false,
      message: message,
    );
  }

  Future<List<TransactionCollection>> readAll() async {
    var isar = await isarProvider.openIsarInstance();
    return await isar.transactionCollections.where().findAll();
  }

  Future<List<TransactionCollection>> readAllToday() async {
    var isar = await isarProvider.openIsarInstance();

    var currentDate = DateTime.now();
    var todayDate = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
    );

    var firstDate = todayDate.millisecondsSinceEpoch - 1;
    var lastDate = DateTime(
      todayDate.year,
      todayDate.month,
      todayDate.day + 1,
    ).millisecondsSinceEpoch;

    return await isar.transactionCollections
        .filter()
        .dateGreaterThan(firstDate)
        .dateLessThan(lastDate)
        .findAll();
  }

  Future<TransactionResult> deleteById({
    required int id,
  }) async {
    String? message;
    var isar = await isarProvider.openIsarInstance();

    try {
      await isar.writeTxn(() async {
        await isar.transactionCollections.delete(id);
      });

      return TransactionResult(success: true);
    } catch (_) {}

    return TransactionResult(
      success: false,
      message: message,
    );
  }

  Stream<List<TransactionCollection>> stream() async* {
    var isar = await isarProvider.openIsarInstance();
    yield* isar.transactionCollections.where().watch();
  }

  Stream<List<TransactionCollection>> streamToday() async* {
    var isar = await isarProvider.openIsarInstance();

    var currentDate = DateTime.now();
    var todayDate = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
    );

    var firstDate = todayDate.millisecondsSinceEpoch - 1;
    var lastDate = DateTime(
      todayDate.year,
      todayDate.month,
      todayDate.day + 1,
    ).millisecondsSinceEpoch;

    yield* isar.transactionCollections
        .filter()
        .dateGreaterThan(firstDate)
        .dateLessThan(lastDate)
        .watch();
  }
}
