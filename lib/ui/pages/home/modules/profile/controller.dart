import 'package:get/get.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/theme.dart';

class HomeProfileController extends GetxController {
  final ThemeService themeService;

  HomeProfileController({
    required this.themeService,
  });

  void toManageTransactionCategory() =>
      Get.toNamed(Routes.manageTransactionCategory);

  void switchBrightness() => themeService.switchTheme();
}
