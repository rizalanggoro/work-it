import 'package:get/get.dart';
import 'package:work_it/ui/pages/create_transaction/binding.dart';
import 'package:work_it/ui/pages/create_transaction/view.dart';
import 'package:work_it/ui/pages/create_transaction_category/binding.dart';
import 'package:work_it/ui/pages/create_transaction_category/view.dart';
import 'package:work_it/ui/pages/create_wallet/binding.dart';
import 'package:work_it/ui/pages/create_wallet/view.dart';
import 'package:work_it/ui/pages/detail_transaction/binding.dart';
import 'package:work_it/ui/pages/detail_transaction/view.dart';
import 'package:work_it/ui/pages/home/binding.dart';
import 'package:work_it/ui/pages/home/modules/dashboard/binding.dart';
import 'package:work_it/ui/pages/home/modules/profile/binding.dart';
import 'package:work_it/ui/pages/home/modules/task/binding.dart';
import 'package:work_it/ui/pages/home/modules/transaction/binding.dart';
import 'package:work_it/ui/pages/home/view.dart';
import 'package:work_it/ui/pages/manage_task_category/binding.dart';
import 'package:work_it/ui/pages/manage_task_category/view.dart';
import 'package:work_it/ui/pages/manage_transaction_category/binding.dart';
import 'package:work_it/ui/pages/manage_transaction_category/view.dart';
import 'package:work_it/ui/pages/manage_wallet/binding.dart';
import 'package:work_it/ui/pages/manage_wallet/view.dart';
import 'package:work_it/ui/pages/select_transaction_category/binding.dart';
import 'package:work_it/ui/pages/select_transaction_category/view.dart';

abstract class Routes {
  static const home = '/';

  static const createTransaction = '/create-transaction';
  static const createTransactionCategory = '/create-transaction-category';
  static const createWallet = '/create-wallet';

  static const manageTransactionCategory = '/manage-transaction-category';
  static const manageTaskCategory = '/manage-task-category';
  static const manageWallet = '/manage-wallet';

  static const detailTransaction = '/detail-transaction';

  static const selectTransactionCategory = '/select-transaction-category';

  static final pages = [
    GetPage(
      name: home,
      page: () => const HomeView(),
      bindings: [
        HomeBinding(),
        HomeDashboardBinding(),
        HomeTaskBinding(),
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
    GetPage(
      name: createWallet,
      page: () => const CreateWalletView(),
      binding: CreateWalletBinding(),
    ),

    // todo: manage
    GetPage(
      name: manageTransactionCategory,
      page: () => const ManageTransactionCategoryView(),
      binding: ManageTransactionCategoryBinding(),
    ),
    GetPage(
      name: manageTaskCategory,
      page: () => const ManageTaskCategoryView(),
      binding: ManageTaskCategoryBinding(),
    ),
    GetPage(
      name: manageWallet,
      page: () => const ManageWalletView(),
      binding: ManageWalletBinding(),
    ),

    // todo: detail
    GetPage(
      name: detailTransaction,
      page: () => const DetailTransactionView(),
      binding: DetailTransactionBinding(),
    ),

    // todo: select
    GetPage(
      name: selectTransactionCategory,
      page: () => const SelectTransactionCategoryView(),
      binding: SelectTransactionCategoryBinding(),
    ),
  ];
}
