import 'package:get/get.dart';
import 'package:work_it/ui/pages/create_transaction/binding.dart';
import 'package:work_it/ui/pages/create_transaction/view.dart';
import 'package:work_it/ui/pages/create_transaction_category/binding.dart';
import 'package:work_it/ui/pages/create_transaction_category/view.dart';
import 'package:work_it/ui/pages/detail_transaction/binding.dart';
import 'package:work_it/ui/pages/detail_transaction/view.dart';
import 'package:work_it/ui/pages/home/binding.dart';
import 'package:work_it/ui/pages/home/modules/profile/binding.dart';
import 'package:work_it/ui/pages/home/modules/transaction/binding.dart';
import 'package:work_it/ui/pages/home/view.dart';
import 'package:work_it/ui/pages/manage_transaction_category/binding.dart';
import 'package:work_it/ui/pages/manage_transaction_category/view.dart';

abstract class Routes {
  static const home = '/';
  static const createTransaction = '/create-transaction';
  static const createTransactionCategory = '/create-transaction-category';
  static const manageTransactionCategory = '/manage-transaction-category';
  static const detailTransaction = '/detail-transaction';

  static final pages = [
    GetPage(
      name: home,
      page: () => const HomeView(),
      bindings: [
        HomeBinding(),
        HomeTransactionBinding(),
        HomeProfileBinding(),
      ],
    ),

    // todo: create
    GetPage(
      name: createTransaction,
      page: () => const CreateTransactionView(),
      binding: CreateTransactionBinding(),
    ),
    GetPage(
      name: createTransactionCategory,
      page: () => const CreateTransactionCategoryView(),
      binding: CreateTransactionCategoryBinding(),
    ),

    // todo: manage
    GetPage(
      name: manageTransactionCategory,
      page: () => const ManageTransactionCategoryView(),
      binding: ManageTransactionCategoryBinding(),
    ),

    // todo: detail
    GetPage(
      name: detailTransaction,
      page: () => const DetailTransactionView(),
      binding: DetailTransactionBinding(),
    ),
  ];
}
