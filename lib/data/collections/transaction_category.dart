import 'package:isar/isar.dart';
import 'package:work_it/data/collections/transaction.dart';
import 'package:work_it/data/enums/transaction_type.dart';

part 'transaction_category.g.dart';

@collection
class TransactionCategoryCollection {
  Id id = Isar.autoIncrement;

  String name;

  @Enumerated(EnumType.name)
  TransactionType transactionType;

  @Backlink(to: 'category')
  final transactions = IsarLinks<TransactionCollection>();

  TransactionCategoryCollection({
    required this.name,
    required this.transactionType,
  });
}
