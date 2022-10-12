import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:web_site_ahmetozkanio/src/home/home_view.dart';
import 'package:web_site_ahmetozkanio/src/projects/project_detail/project_detail_view.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/green_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/purple_theme.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'ahmetozkanio',
        theme: purpleTheme,
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => Home(),
          ),
          GetPage(
            name: '/project/:name',
            page: () => ProjectDetailView(),
          ),
        ],
        debugShowCheckedModeBanner: false,
        home: HomeView());
  }
}
