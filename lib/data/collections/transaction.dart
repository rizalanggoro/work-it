import 'package:isar/isar.dart';
import 'package:work_it/data/collections/transaction_category.dart';

part 'transaction.g.dart';

@collection
class TransactionCollection {
  Id id = Isar.autoIncrement;

  double amount;
  String note;
  int date;

  final category = IsarLink<TransactionCategoryCollection>();

  TransactionCollection({
    required this.amount,
    required this.note,
    required this.date,
  });
}
