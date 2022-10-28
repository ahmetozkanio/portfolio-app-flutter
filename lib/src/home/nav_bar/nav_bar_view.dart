import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:web_site_ahmetozkanio/src/certificates/certificate_view.dart';

import '../../projects/projects_view.dart';
import '../home_view_controller.dart';

List<Widget> homeNavBarPageViewItems() {
  return [
    ProjectsView(),
    CertificateView(),
    Text(
      'Text3',
    ),
    Text(
      'Text4',
    )
  ];
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
        style: GnavStyle.oldSchool,
        haptic: true, // haptic feedback
        tabBorderRadius: 8,
        tabActiveBorder: Border.all(
            color: Theme.of(context).backgroundColor,
            width: 1), // tab button border
        // tabBorder: Border.all(
        //     color: Colors.grey, width: 1), // tab button border
        // tabShadow: [
        //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
        // ], // tab button shadow
        curve: Curves.easeInOutQuad, // tab animation curves
        duration: Duration(milliseconds: 300), // tab animation duration
        gap: 8, // the tab button gap between icon and text
        color: Colors.grey[400], // unselected icon color
        activeColor:
            Theme.of(context).primaryColor, // selected icon and text color
        iconSize: 24, // tab button icon size
        // tabBackgroundColor: Colors.purple
        //     .withOpacity(0.1), // selected tab background color
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: 5), // navigation bar padding
        tabs: [
          GButton(
            haptic: true,
            icon: Icons.show_chart_outlined,
            text: 'projects',
          ),
          GButton(
            icon: Icons.heart_broken,
            text: 'certificates',
          ),
          GButton(
            icon: Icons.receipt_long_outlined,
            text: 'about',
          ),
          GButton(
            icon: Icons.access_alarm,
            text: 'Kayıtlar',
          ),
        ]),
  );
}
