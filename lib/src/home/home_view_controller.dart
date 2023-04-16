import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
 RxInt selectedIndex = 0.obs;
  var icon = Icons.wb_sunny_outlined.obs;

   @override
  void onInit() {
    super.onInit();
    getThemeInfo();
  }

  void indexChange(index) {
    selectedIndex.value = index;
  }

    getThemeInfo() {
    if (!Get.isDarkMode) {
      icon.value = Icons.dark_mode_outlined;
    }
  }
}
