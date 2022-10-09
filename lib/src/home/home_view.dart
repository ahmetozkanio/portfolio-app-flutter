import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/home/home_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/home/nav_bar/nav_bar_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    HomeViewController homeViewController = Get.put(HomeViewController());

    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 145,
                        height: 145,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/profile_photo.jpg'),
                              fit: BoxFit.fitWidth),
                          border: Border.all(
                            width: 4.0,
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(145, 145)),
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ahmet Ozkan',
                            style: TextStyle(
                              fontSize: 46,
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            'Software Engineer',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      "assets/svg/github.svg",
                                      color: Colors.red,
                                      semanticsLabel: 'github')),
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      "assets/svg/linkedin.svg",
                                      color: Colors.red,
                                      semanticsLabel: 'linkedin')),
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      "assets/svg/whatsapp.svg",
                                      color: Colors.red,
                                      semanticsLabel: 'whatsapp')),
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      "assets/svg/medium.svg",
                                      color: Colors.red,
                                      semanticsLabel: 'medium')),
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      "assets/svg/twitter.svg",
                                      color: Colors.red,
                                      semanticsLabel: 'twitter')),
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      "assets/svg/instagram.svg",
                                      color: Colors.red,
                                      semanticsLabel: 'instagram'))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    width: 155,
                    height: 155,
                    child: Text(
                        "ozkan ozkan ozkan ozkan ozkan ozkan ozkan ozkan ozkan ozkan "),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    width: 155,
                    height: 155,
                    child: Text(
                        "ozkan ozkan ozkan ozkan ozkan ozkan ozkan ozkan ozkan ozkan "),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    width: 155,
                    height: 155,
                    child: Text(
                        "ozkan ozkan ozkan ozkan ozkan ozkan ozkan ozkan ozkan ozkan "),
                  ),
                ),
              ],
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

            homeNavBar(homeViewController, context),
            SizedBox(
              height: 16.0,
            ),
            Obx(() => Container(
                  width: 450,
                  child: homeNavBarPageViewItems()
                      .elementAt(homeViewController.selectedIndex.value),
                ))
          ],
        ),
      ),
    );
  }
}
