import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/home/home_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/home/nav_bar/nav_bar_view.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/dark_theme.dart';

import '../user/user_view.dart';
import 'footer/footer_view.dart';

class HomeView extends GetView<HomeViewController> {
  HomeView({Key? key}) : super(key: key);

  //PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DelayedDisplay(
        slidingCurve: Curves.easeOutCirc,
        delay: Duration(seconds: 1),
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
                      delay: Duration(seconds: 1),
                      child: Text("ahmetozkanio"),
                    ),
                    IconButton(onPressed: () {
                      Get.changeThemeMode(ThemeMode.light,);
                      }, icon: Icon(Icons.dark_mode,),),
                  ],
                ),
              ),
              Container(
                width: 800,
                child: DelayedDisplay(
                  slidingCurve: Curves.easeOutCirc,
                  delay: Duration(milliseconds: 1500),
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
