import 'package:get/get.dart';

import 'controller.dart';

class HomeDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeDashboardController());
  }
}
