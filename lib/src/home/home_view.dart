import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/home/home_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/home/nav_bar/nav_bar_view.dart';

import '../user/user_view.dart';

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
            UserView(),
            SizedBox(
              height: 16.0,
            ),
            Card(
              child: Stack(
                children: [
                  Positioned(
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 24.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 227, 227, 227),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 13,
                                height: 13,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 85, 85),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Container(
                                width: 13,
                                height: 13,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 186, 36),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Container(
                                width: 13,
                                height: 13,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 202, 61),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.all(24.0),
                      child: Text(
                          "asfas fasf safk alsfk alskf laskf lask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasfl")),
                ],
              ),
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
                  width: 450,
                  child: homeNavBarPageViewItems()
                      .elementAt(controller.selectedIndex.value),
                ))
          ],
        ),
      ),
    );
  }
}
