import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:web_site_ahmetozkanio/src/certificates/certificate_view.dart';
import 'package:web_site_ahmetozkanio/src/cv/cv_view.dart';
import 'package:web_site_ahmetozkanio/src/experience/experience_view.dart';

import '../../education/education_view.dart';
import '../../projects/projects_view.dart';
import '../home_view_controller.dart';

List<Widget> homeNavBarPageViewItems() {
  return [ProjectsView(),EducationView(),ExperienceView()];
}

Widget homeNavBar(HomeViewController homeViewController, BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.only(left: 8.0, top: 16.0, right: 8.0),
    scrollDirection: Axis.horizontal,
    child: GNav(
        selectedIndex: homeViewController.selectedIndex.value,
        onTabChange: (index) {
          homeViewController.indexChange(index);
        },
        // rippleColor: Color.fromARGB(
        //     255, 66, 66, 66), // tab button ripple color when pressed
        // hoverColor:
        //     Color.fromARGB(255, 97, 97, 97), // tab button hover color
        style: GnavStyle.google,
        haptic: true, // haptic feedback
        tabBorderRadius: 8,
        tabActiveBorder: Border.all(
            color: Get.isDarkMode ? Theme.of(context).primaryColorLight : Theme.of(context).primaryColorDark,
            width: 1), // tab button border
        // tabBorder: Border.all(
        //     color: Colors.grey, width: 1), // tab button border
        // tabShadow: [
        //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
        // ], // tab button shadow
        curve: Curves.decelerate, // tab animation curves
        duration: Duration(milliseconds: 300), // tab animation duration
        gap: 3, // the tab button gap between icon and text
         // unselected icon color
         
        activeColor:
            Get.isDarkMode
            ? Theme.of(context).primaryColorLight
            : Theme.of(context)
                .primaryColorDark  , // selected icon and text color
        iconSize: 24, // tab button icon size
        // tabBackgroundColor: Colors.purple
        //     .withOpacity(0.1), // selected tab background color
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: 5), // navigation bar padding
        tabs: [
          GButton(
            haptic: true,
            icon: Icons.code,
            text: 'projects',
          ),
        GButton(
            haptic: true,
            icon: Icons.school_outlined,
            text: 'education',
          ),
        GButton(
            haptic: true,
            icon: Icons.business_center_outlined,
            text: 'experience',
          ),
          // GButton(
          //   haptic: true,
          //   icon: Icons.person_2_outlined,
          //   text: 'resume',
          // ),
        ]),
  );
}
