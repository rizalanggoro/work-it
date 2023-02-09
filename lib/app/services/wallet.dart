import 'package:get/get.dart';
import 'package:work_it/data/collections/wallet.dart';
import 'package:work_it/data/repositories/wallet.dart';

class WalletService extends GetxService {
  final WalletRepository walletRepository;

  WalletService({
    required this.walletRepository,
  });

  final RxList<WalletCollection> wallets = RxList([]);

  @override
  void onReady() {
    super.onReady();

    _read();
    _listen();
  }

  void _read() async {
    wallets.value = await walletRepository.readAll();
  }

  void _listen() {
    walletRepository.stream().listen((event) => wallets.value = event);
  }
}
