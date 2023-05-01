import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/core/theme_cache.dart';
import 'package:web_site_ahmetozkanio/src/home/home_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/home/nav_bar/nav_bar_view.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/dark_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/green_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/grey_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/theme.dart';
import 'package:web_site_ahmetozkanio/src/utils/custom_rect_tween.dart';

import '../user/user_view.dart';
import '../utils/launch_url.dart';
import 'footer/footer_view.dart';

class HomeView extends GetView<HomeViewController> {
  HomeView({Key? key}) : super(key: key);

  //PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DelayedDisplay(
        slidingCurve: Curves.easeOutCirc,
        delay: Duration(milliseconds: 300),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DelayedDisplay(
                      delay: Duration(milliseconds:300),
                      child: InkWell(onTap: () {customLaunchUrl("mailto:ahmetozkanio@yahoo.com");}, child: Text("ahmetozkanio",style: TextStyle(fontWeight: FontWeight.w500),)),
                    ),
                    Row(
                      children: [
                        Obx(() => IconButton(
                          splashRadius: 22.0,
                              onPressed: () {
                                if (!Get.isDarkMode) {
                                  ThemeCacheManager.saveDarkTheme(
                                    EnumThemeData.darkTheme,
                                  );
                                  print("Dark Mode");
                                  // Get.changeTheme(ThemeData.dark());
                                  Get.changeThemeMode(ThemeMode.dark);
                                  controller.icon.value = Icons.wb_sunny_outlined;
                                } else {
                                  print("Light Mode");
                                  ThemeCacheManager.removeDarkTheme();
                                  
                                  ThemesController.initialTheme();
                                  controller.icon.value = Icons.dark_mode_outlined;
                                }
                              },
                              icon: Icon(
                                controller.icon.value,
                              ),
                            ),
                            ),
                      ],
                    ),
                  ],
                ),
              ),
//                     BlockPicker(
//   pickerColor: Colors.red, //default color
//   onColorChanged: (Color color){ //on color picked
//       print(color);
//   }, 
// ),

              Container(
                width: 800,
                child: DelayedDisplay(
                  slidingCurve: Curves.easeOutCirc,
                  delay: Duration(milliseconds: 400),
                  child: UserView(),
                ),
              ),
              homeNavBar(controller, context),
              SizedBox(
                height: 16.0,
              ),
              Obx(() => Container(
                    width: 800,
                    child: homeNavBarPageViewItems()
                        .elementAt(controller.selectedIndex.value),
                  )),
              FooterView()
            ],
          ),
        ),
      ),
    );
  }
}
