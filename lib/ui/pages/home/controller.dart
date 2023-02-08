import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt navigationIndex = RxInt(0);

  void changeNavigation(int index) => navigationIndex.value = index;
}
