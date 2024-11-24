import 'package:ahmetozkanio/src/utils/theme/text_theme.dart';
import 'package:ahmetozkanio/src/utils/theme/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

final class ThemeController extends GetxController with WidgetsBindingObserver {
  var isDarkMode = false.obs;
  late MaterialTheme theme;

  ThemeData get themeData =>
      isDarkMode.value ? getDarkTheme() : getLightTheme();

  ThemeController() {
    WidgetsBinding.instance.addObserver(this);

    _updateTheme();

    TextTheme textTheme = createTextTheme(Get.theme, "Urbanist", "Urbanist");

    theme = MaterialTheme(textTheme);
  }

  @override
  void didChangePlatformBrightness() {
    _updateTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  ThemeData getLightTheme() {
    return theme.light();
  }

  ThemeData getDarkTheme() {
    return theme.dark();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  void _updateTheme() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    isDarkMode.value = brightness == Brightness.dark;
  }
}
