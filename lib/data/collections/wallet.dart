import 'package:isar/isar.dart';
import 'package:work_it/data/collections/transaction.dart';

part 'wallet.g.dart';

@collection
class WalletCollection {
  final Id id = Isar.autoIncrement;

  String name;
  double initialAmount;

  final transactions = IsarLinks<TransactionCollection>();

  WalletCollection({
    required this.name,
    required this.initialAmount,
  });
}
