import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:work_it/app/routes.dart';
import 'package:work_it/app/services/theme.dart';

class HomeProfileController extends GetxController {
  final ThemeService themeService;

  HomeProfileController({
    required this.themeService,
  });

  final RxString version = RxString('-');

  @override
  void onInit() {
    super.onInit();

    _getAppVersion();
  }

  void _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version.value = '${packageInfo.version}+${packageInfo.buildNumber}';
  }

  void toManageTaskCategory() => Get.toNamed(Routes.manageTaskCategory);

  void toManageTransactionCategory() =>
      Get.toNamed(Routes.manageTransactionCategory);

  void toManageWallet() => Get.toNamed(Routes.manageWallet);

  void toCheckRelease() async {
    await launchUrlString(
      'https://github.com/rizalanggoro/work-it/releases',
      mode: LaunchMode.externalApplication,
    );
  }

  void switchBrightness() => themeService.switchTheme();
}
