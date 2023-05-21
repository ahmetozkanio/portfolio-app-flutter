import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:web_site_ahmetozkanio/src/certificates/certificate_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/education/education_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/experience/experience_model.dart';
import 'package:web_site_ahmetozkanio/src/experience/experience_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/home/home_view.dart';
import 'package:web_site_ahmetozkanio/src/home/home_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/projects/projects_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/green_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/grey_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/purple_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/yellow_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/theme.dart';
import 'package:web_site_ahmetozkanio/src/user/user_view_controller.dart';

import '../theme/panachefile/dark_theme.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemesController _themesController = Get.put(ThemesController());
    return GetMaterialApp(
      title: 'ahmetozkanio',
      initialRoute: '/',
      theme: greyTheme,
      darkTheme: darkTheme,
      initialBinding: BindingsBuilder(
        (() {
          Get.lazyPut<HomeViewController>(() => HomeViewController());
          Get.lazyPut<UserViewController>(() => UserViewController());
          Get.lazyPut<ProjectsViewController>(() => ProjectsViewController());
          // Get.lazyPut<EducationViewController>(() => EducationViewController());
          // Get.lazyPut<ExperienceViewController>(() => ExperienceViewController());
        }),
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeView(),
          // binding: BindingsBuilder(() {
          //   Get.lazyPut<HomeViewController>(() => HomeViewController());
          //   // Get.put<Service>(()=> Api());
          // }),
        ),
       
      ],
      debugShowCheckedModeBanner: false,
      //home: HomeView()
    );
  }
}
