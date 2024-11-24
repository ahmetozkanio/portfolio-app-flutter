import 'package:ahmetozkanio/src/features/education/education_view_controller.dart';
import 'package:ahmetozkanio/src/features/experience/experience_view_controller.dart';
import 'package:ahmetozkanio/src/features/home/home_view.dart';
import 'package:ahmetozkanio/src/features/home/home_view_controller.dart';
import 'package:ahmetozkanio/src/features/projects/projects_view_controller.dart';
import 'package:ahmetozkanio/src/features/user/user_view_controller.dart';
import 'package:ahmetozkanio/src/utils/theme/theme_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final class App extends StatelessWidget {
  App({super.key}) {
    Get.put(ThemeController(), permanent: true);
  }

  late final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'ahmetozkanio',
        initialRoute: '/',
        initialBinding: BindingsBuilder(
          (() {
            Get.lazyPut<HomeViewController>(() => HomeViewController());
            Get.lazyPut<UserViewController>(() => UserViewController());
            Get.lazyPut<EducationViewController>(
                () => EducationViewController());
            Get.lazyPut<ExperienceViewController>(
                () => ExperienceViewController());
            Get.lazyPut<UserViewController>(() => UserViewController());
            Get.lazyPut<ProjectsViewController>(() => ProjectsViewController());
          }),
        ),
        theme: themeController.themeData,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: kDebugMode,
        getPages: [
          GetPage(
            name: '/',
            page: () => HomeView(),
          ),
        ],
      ),
    );
  }
}
