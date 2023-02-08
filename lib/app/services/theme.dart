import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService extends GetxService {
  final RxBool darkMode = RxBool(false);

  @override
  void onReady() async {
    super.onReady();

    darkMode.value = GetStorage().read('darkMode') ?? false;
    _changeThemeMode();
  }

  void switchTheme() async {
    darkMode.value = !darkMode.value;
    await GetStorage().write('darkMode', darkMode.value);

    _changeThemeMode();
  }

  void _changeThemeMode() {
    if (darkMode.value) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
  }
}
