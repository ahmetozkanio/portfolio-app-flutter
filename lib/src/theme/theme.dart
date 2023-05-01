import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/amber_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/black_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/blue_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/bluegray_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/brown_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/cyan_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/dark_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/deeporange_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/deeppurple_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/green_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/grey_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/indigo_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/lightblue_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/lightgreen_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/lime_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/orange_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/pink_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/purple_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/red_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/teal_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/yellow_theme.dart';

import '../core/theme_cache.dart';

class ThemesController extends GetxController with ThemeCacheManager {
  static var character = EnumThemeData.blueTheme;

  static backgroundColor(context) {
    return Theme.of(context).secondaryHeaderColor;
  }

  @override
  void onInit() {
    super.onInit();
    // radioThemeValue();
    initialTheme();
  }
  static initialTheme() {
    var themeData = ThemesController.getStorageInitTheme();
    if (themeData != null) {
      // Get.changeTheme(themeData);
      Get.changeThemeMode(ThemeMode.dark);
      return themeData;
    } else {
    Get.changeThemeMode(ThemeMode.light);
     
    }
  }
  static ThemeData? getStorageInitTheme() {
    var init = ThemeCacheManager.getTheme();
    var darkTheme = ThemeCacheManager.getDarkTheme();

    if (darkTheme != null) {
      for (var index in EnumThemeData.values) {
        if (index.toString() == darkTheme) {
          return themeSelect(index);
        }
      }
    }
    if (init != null) {
      for (var index in EnumThemeData.values) {
        if (index.toString() == init) {
          return themeSelect(index);
        }
      }
    }
    return null;
  }

  // radioThemeValue() {
  //   var init = ThemeCacheManager.getTheme();
  //   if (init != null) {
  //     for (var index in EnumThemeData.values) {
  //       if (index.toString() == init) {
  //         character = index;
  //       }
  //     }
  //   }
  // }

  static ThemeData themeSelect(EnumThemeData? enumThemeData) {
    switch (enumThemeData) {
      case EnumThemeData.darkTheme:
        return darkTheme;
      case EnumThemeData.redTheme:
        return redTheme;
      case EnumThemeData.pinkTheme:
        return pinkTheme;
      case EnumThemeData.purpleTheme:
        return purpleTheme;
      case EnumThemeData.deepPurpleTheme:
        return deepPurpleTheme;
      case EnumThemeData.indigoTheme:
        return indigoTheme;
      case EnumThemeData.blueTheme:
        return blueTheme;
      case EnumThemeData.lightBlueTheme:
        return lightBlueTheme;
      case EnumThemeData.cyanTheme:
        return cyanTheme;
      case EnumThemeData.tealTheme:
        return tealTheme;
      case EnumThemeData.greenTheme:
        return greenTheme;
      case EnumThemeData.lightGreenTheme:
        return lightGreenTheme;
      case EnumThemeData.limeTheme:
        return limeTheme;
      case EnumThemeData.yellowTheme:
        return yellowTheme;
      case EnumThemeData.amberTheme:
        return amberTheme;
      case EnumThemeData.orangeTheme:
        return orangeTheme;
      case EnumThemeData.deepOrangeTheme:
        return deepOrangeTheme;
      case EnumThemeData.brownTheme:
        return brownTheme;
      case EnumThemeData.blueGrayTheme:
        return blueGrayTheme;
      case EnumThemeData.blackTheme:
        return blackTheme;
      case EnumThemeData.greyTheme:
        return greyTheme;
      default:
        return ThemeData.light();
    }
  }

  saveThemes(EnumThemeData? enumThemeData) async {
    await saveTheme(enumThemeData);
  }
}

enum EnumThemeData {
  darkTheme,
  amberTheme,
  blackTheme,
  blueTheme,
  blueGrayTheme,
  brownTheme,
  cyanTheme,
  deepOrangeTheme,
  deepPurpleTheme,
  greenTheme,
  greyTheme,
  orangeTheme,
  indigoTheme,
  lightBlueTheme,
  lightGreenTheme,
  limeTheme,
  pinkTheme,
  purpleTheme,
  redTheme,
  tealTheme,
  yellowTheme
}
