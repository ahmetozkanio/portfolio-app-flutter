import 'package:ahmetozkanio/src/features/experience/experience_view.dart';
import 'package:ahmetozkanio/src/features/projects/projects_view.dart';
import 'package:ahmetozkanio/src/features/projects/indie_project_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../education/education_view.dart';
import '../home/home_view_controller.dart';

List<Widget> homeNavBarPageViewItems() {
  return [IndieProjectView(), ProjectView(), EducationView(), ExperienceView()];
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
      style: GnavStyle.google,
      haptic: true, // haptic feedback
      tabBorderRadius: 8,
      tabActiveBorder: Border.all(
        color: Theme.of(context).colorScheme.secondary,
        width: 1,
      ), // tab button border
      curve: Curves.decelerate, // tab animation curves
      duration: Duration(milliseconds: 200), // tab animation duration
      gap: 10, // the tab button gap between icon and text
      activeColor: Theme.of(context).colorScheme.secondary,
      color: Theme.of(context).iconTheme.color?.withOpacity(0.7),

      iconSize: 18, // tab button icon size
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // padding
      tabs: [
        GButton(
          haptic: true,
          icon: FontAwesomeIcons.appStoreIos,
          text: 'indie apps',
        ),
        GButton(
          haptic: true,
          icon: FontAwesomeIcons.terminal,
          text: 'projects',
        ),
        GButton(
          haptic: true,
          icon: FontAwesomeIcons.graduationCap,
          text: 'education',
        ),
        GButton(
          haptic: true,
          icon: FontAwesomeIcons.userTie,
          text: 'experience',
        ),
      ],
    ),
  );
}
