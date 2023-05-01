import 'package:get_storage/get_storage.dart';

import '../theme/theme.dart';

mixin ThemeCacheManager {
  static final GetStorage themeBox = GetStorage();
  Future<bool> saveTheme(EnumThemeData? themeData) async {
    await themeBox.write("theme", themeData.toString());
    return true;
  }

  static Future<bool> saveDarkTheme(EnumThemeData? themeData) async {
    await themeBox.write("themeDark", themeData.toString());
    return true;
  }

  static String? getTheme() {
    var themeData = themeBox.read("theme").toString();
    return themeData;
  }

  static String? getDarkTheme() {
    var themeData = themeBox.read("themeDark").toString();

    return themeData;
  }

  static Future<void> removeDarkTheme() async {
    await themeBox.remove("themeDark".toString());
  }
}
