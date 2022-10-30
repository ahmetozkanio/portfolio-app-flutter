import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../service/launch_url.dart';
import 'model/user_model.dart';
import 'user_view_controller.dart';

class UserView extends GetView<UserViewController> {
  UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
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
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Obx(
                () => Html(data: controller.user.value.description ?? ''),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userAccounts(BuildContext context) {
    return Obx(() => controller.userLoading.value
        ? CircularProgressIndicator()
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var item in controller.user.value.userAccounts!)
                  IconButton(
                    onPressed: () => customLaunchUrl(item.accountUrl ?? ''),
                    icon: SvgPicture.network(
                        controller.url + item.accountImage!,
                        color: Theme.of(context).primaryColor,
                        semanticsLabel: '${item.accountName}'),
                  ),
                // IconButton(
                //     onPressed: () {},
                //     icon: SvgPicture.asset("assets/svg/linkedin.svg",
                //         color: Theme.of(context).primaryColor,
                //         semanticsLabel: 'linkedin')),
                // IconButton(
                //     onPressed: () {},
                //     icon: SvgPicture.asset("assets/svg/whatsapp.svg",
                //         color: Theme.of(context).primaryColor,
                //         semanticsLabel: 'whatsapp')),
                // IconButton(
                //     onPressed: () {},
                //     icon: SvgPicture.asset("assets/svg/medium.svg",
                //         color: Theme.of(context).primaryColor,
                //         semanticsLabel: 'medium')),
                // IconButton(
                //     onPressed: () {},
                //     icon: SvgPicture.asset("assets/svg/twitter.svg",
                //         color: Theme.of(context).primaryColor,
                //         semanticsLabel: 'twitter')),
                // IconButton(
                //     onPressed: () {},
                //     icon: SvgPicture.asset("assets/svg/instagram.svg",
                //         color: Theme.of(context).primaryColor,
                //         semanticsLabel: 'instagram'))
              ],
            ),
          ));
  }

  Widget userTitle() {
    return Obx(() => Text(
          controller.user.value.title ?? '',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22,
          ),
        ));
  }

  Widget userName() {
    return Obx(
      () => Text(
        '${controller.user.value.firsName ?? ''} ${controller.user.value.lastName ?? ""}',
        style: TextStyle(
          fontSize: 46,
        ),
      ),
    );
  }

  Widget userImage(BuildContext context) {
    return Container(
      width: 145,
      height: 145.0,
      child: Obx(() => controller.userLoading.value
          ? CircularProgressIndicator()
          : CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                height: 145.0,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
              ),
              itemCount: controller.user.value.userImages?.length ?? 0,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                width: 145,
                height: 145,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(controller.url +
                              controller
                                  .user.value.userImages?[itemIndex].image ??
                          ''),
                      fit: BoxFit.fitWidth),
                  border: Border.all(
                    width: 4.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(145, 145)),
                ),
              ),
            )),
    );
  }
}
