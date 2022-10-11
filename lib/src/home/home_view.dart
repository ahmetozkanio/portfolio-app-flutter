import 'package:auto_size_text/auto_size_text.dart';
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
            Column(
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
                      width: 24.0,
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
                          'Computer Engineer',
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
                                icon: SvgPicture.asset("assets/svg/github.svg",
                                    color: Theme.of(context).primaryColor,
                                    semanticsLabel: 'github')),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    "assets/svg/linkedin.svg",
                                    color: Theme.of(context).primaryColor,
                                    semanticsLabel: 'linkedin')),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    "assets/svg/whatsapp.svg",
                                    color: Theme.of(context).primaryColor,
                                    semanticsLabel: 'whatsapp')),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset("assets/svg/medium.svg",
                                    color: Theme.of(context).primaryColor,
                                    semanticsLabel: 'medium')),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset("assets/svg/twitter.svg",
                                    color: Theme.of(context).primaryColor,
                                    semanticsLabel: 'twitter')),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    "assets/svg/instagram.svg",
                                    color: Theme.of(context).primaryColor,
                                    semanticsLabel: 'instagram'))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
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
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(24.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'This item costs ',
                            children: <TextSpan>[
                              TextSpan(
                                text: '\$8.99',
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' \$3.99 dasd asd sad asd asd asd asdasd asdas da das ads ',
                              ),
                            ],
                          ),
                        )),
                  ),
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
