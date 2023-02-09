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
}
