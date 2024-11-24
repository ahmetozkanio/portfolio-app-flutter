import 'package:ahmetozkanio/src/features/home/home_view_controller.dart';
import 'package:ahmetozkanio/src/features/nav_bar/nav_bar_view.dart';
import 'package:ahmetozkanio/src/utils/theme/theme_controller.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user/user_view.dart';
import '../../utils/launch_url.dart';
import '../footer/footer_view.dart';

final class HomeView extends GetView<HomeViewController> {
  HomeView({Key? key}) : super(key: key);

  final ThemeController _themeController = Get.find();

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
                      delay: Duration(milliseconds: 300),
                      child: InkWell(
                          onTap: () {
                            customLaunchUrl("mailto:ahmetozkanio@yahoo.com");
                          },
                          child: Text(
                            "ahmetozkanio@yahoo.com",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                    ),
                    Row(
                      children: [
                        IconButton(
                          splashRadius: 22.0,
                          onPressed: () {
                            _themeController.toggleTheme();
                          },
                          icon: Obx(() => Icon(
                                _themeController.isDarkMode.value
                                    ? Icons.wb_sunny_outlined
                                    : Icons.dark_mode_outlined,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
