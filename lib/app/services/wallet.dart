import 'package:get/get.dart';
import 'package:work_it/data/collections/wallet.dart';

class WalletService extends GetxService {
  final RxList<WalletCollection> wallets = RxList([]);

  @override
  void onReady() {
    super.onReady();

    _read();
    _listen();
  }

  void _read() {}

  void _listen() {}
}
