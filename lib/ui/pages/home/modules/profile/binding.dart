import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/modules/profile/controller.dart';

class HomeProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeProfileController(
      themeService: Get.find(),
    ));
  }
}
