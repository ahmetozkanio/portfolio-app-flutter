import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:web_site_ahmetozkanio/src/certificates/certificate_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/home/home_view.dart';
import 'package:web_site_ahmetozkanio/src/home/home_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/projects/project_detail/project_detail_view.dart';
import 'package:web_site_ahmetozkanio/src/projects/project_detail/project_detail_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/projects/projects_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/green_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/grey_theme.dart';
import 'package:web_site_ahmetozkanio/src/theme/panachefile/purple_theme.dart';
import 'package:web_site_ahmetozkanio/src/user/user_view_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ahmetozkanio',
      theme: greyTheme,
      initialRoute: '/',
      initialBinding: BindingsBuilder(
        (() {
          Get.lazyPut<HomeViewController>(() => HomeViewController());
          Get.lazyPut<UserViewController>(() => UserViewController());
          Get.lazyPut<ProjectsViewController>(() => ProjectsViewController());
          Get.lazyPut<CertificatesViewController>(
              () => CertificatesViewController());
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
        GetPage(
          name: '/project/:slug',
          page: () => ProjectDetailView(),
          transition: Transition.zoom,
          binding: BindingsBuilder(() {
            Get.lazyPut<ProjectDetailViewController>(
                () => ProjectDetailViewController());
            // Get.put<Service>(()=> Api());
          }),
        ),
      ],
      debugShowCheckedModeBanner: false,
      //home: HomeView()
    );
  }
}
