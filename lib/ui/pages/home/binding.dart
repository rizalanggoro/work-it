import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
