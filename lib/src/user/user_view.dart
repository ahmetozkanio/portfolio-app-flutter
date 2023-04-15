import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/constants/constant.dart';
import '../utils/launch_url.dart';
import 'user_view_controller.dart';
import 'package:highlight/languages/dart.dart';

class UserView extends GetView<UserViewController> {
  UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > Constant().getMobileWidth()) {
          return userView(context);
        } else {
          return userViewMobile(context);
        }
      },
    );
  }

  Column userView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            userImage(context),
            SizedBox(
              width: 24.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userName(),
                SizedBox(
                  height: 4.0,
                ),
                userTitle(),
                SizedBox(
                  height: 4.0,
                ),
                userAccounts(context),
              ],
            )
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        userDescription(),
      ],
    );
  }

  Column userViewMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        userImage(context),
        SizedBox(
          height: 16.0,
        ),
        userName(),
        SizedBox(
          height: 4.0,
        ),
        userTitle(),
        SizedBox(
          height: 4.0,
        ),
        userAccounts(context),
        userDescription(),
      ],
    );
  }

  Card userDescription() {
    return Card(
      child: Container(
        width: 600.0,
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 24.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 206, 206, 206),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
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
                          borderRadius: BorderRadius.circular(8),
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
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Obx(
                () => Column(
                  children: [
                    CodeField(
                      controller: CodeController(
                        text: controller.user.value.description,
                        language: dart,
                       
                      ),
                      textStyle: TextStyle(fontFamily: 'SourceCode'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userAccounts(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userAccountButton(context, "https:www.linkedin.com/in/", "linkedin"),
          userAccountButton(context, "https:www.github.com/", "github"),
          userAccountButton(context, "https:www.medium.com/@", "medium"),
          userAccountButton(context, "https:www.twitter.com/@", "twitter"),
          userAccountButton(context, "https:www.instagram.com/", "instagram"),
        ],
      ),
    );
  }

  IconButton userAccountButton(
      BuildContext context, String url, String account) {
    return IconButton(
        splashRadius: 18.0,
        onPressed: () {
          customLaunchUrl("${url}${controller.user.value.username}");
        },
        icon: SvgPicture.asset("assets/svg/${account}.svg",
            color: Theme.of(context).iconTheme.color,
            semanticsLabel: '${account}'));
  }

  Widget userTitle() {
    return Obx(() => Text(
          controller.user.value.username ?? '',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22,
          ),
        ));
  }

  Widget userImage(context) {
    return Container(
      width: 145,
      height: 145,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/profile_photo.jpg"),
            fit: BoxFit.fitWidth),
        border: Border.all(
          width: 4.0,
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.all(Radius.elliptical(145, 145)),
      ),
    );
  }

  Widget userName() {
    return Obx(
      () => Text(
        '${controller.user.value.firstName ?? ''} ${controller.user.value.lastName ?? ""}',
        style: TextStyle(
          fontSize: 46,
        ),
      ),
    );
  }
}
