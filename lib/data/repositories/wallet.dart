import 'dart:developer' as dev;

import 'package:isar/isar.dart';
import 'package:work_it/data/collections/wallet.dart';
import 'package:work_it/data/providers/isar.dart';
import 'package:work_it/data/results/wallet.dart';

class WalletRepository {
  final _devName = 'WalletRepository';

  final IsarProvider isarProvider;

  WalletRepository({
    required this.isarProvider,
  });

  Future<WalletResult> create({
    required WalletCollection collection,
  }) async {
    String? message;

    try {
      var isar = await isarProvider.openIsarInstance();

      // todo: query
      var queryResult = await isar.walletCollections
          .filter()
          .nameEqualTo(collection.name)
          .findFirst();
      if (queryResult == null) {
        // todo: create wallet
        await isar.writeTxn(() async {
          await isar.walletCollections.put(collection);
        });

        return WalletResult(success: true);
      } else {
        message =
            'A wallet with this name has been added! Please use another name...';
      }
    } catch (error) {
      message = 'Something went wrong! Please try again later...';
      dev.log(error.toString(), name: _devName);
    }

    return WalletResult(
      success: false,
      message: message,
    );
  }

  Future<WalletResult> deleteById({
    required int id,
  }) async {
    String? message;

    try {
      var isar = await isarProvider.openIsarInstance();

      var success = await isar.writeTxn(() async {
        return await isar.walletCollections.delete(id);
      });

      return WalletResult(success: success);
    } catch (error) {
      message = 'Something went wrong! Please try again later...';

      dev.log(
        error.toString(),
        name: _devName,
      );
    }

    return WalletResult(
      success: false,
      message: message,
    );
  }

  Future<List<WalletCollection>> readAll() async {
    var isar = await isarProvider.openIsarInstance();
    return await isar.walletCollections.where().sortByName().findAll();
  }

  Stream<List<WalletCollection>> stream() async* {
    var isar = await isarProvider.openIsarInstance();
    yield* isar.walletCollections.where().sortByName().watch();
  }
}
