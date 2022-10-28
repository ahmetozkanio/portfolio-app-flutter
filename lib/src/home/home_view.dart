import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/home/home_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/home/nav_bar/nav_bar_view.dart';

import '../user/user_view.dart';
import 'footer/footer_view.dart';

class HomeView extends GetView<HomeViewController> {
  HomeView({Key? key}) : super(key: key);

  //PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ahmetozkanio"),
                  IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
                ],
              ),
            ),
            Container(
              width: 800,
              child: UserView(),
            ),

            /*
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      //primary: Colors.black,
                      ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    child: Row(
                      children: [
                        Text(
                          "Download cv",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Icon(Icons.cloud_download_outlined)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 38.0, vertical: 18.0),
                    child: Text(
                      "Contact me",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    surfaceTintColor: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
        */

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
    );
  }
}
