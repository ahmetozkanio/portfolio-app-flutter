import 'package:ahmetozkanio/src/utils/constants/constant.dart';
import 'package:ahmetozkanio/src/utils/widgets/account_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'user_view_controller.dart';

class UserView extends GetView<UserViewController> {
  UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > Constant.getMobileWidth()) {
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
        userDescription(context),
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
        userDescription(context),
      ],
    );
  }

  Widget userDescription(BuildContext context) {
    final ThemeData theme = Get.theme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Container(
        width: double.infinity, // Make the width responsive to the device
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Theme.of(context)
                .colorScheme
                .surfaceContainerLow, // Kenarlık rengi
            width: 1, // Kenarlık kalınlığı
          ),
          // color: colorScheme
          //     .surfaceContainerLow, // Set the background color from the theme
        ),
        child: Stack(
          children: [
            // Top decorative bar
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 24.0,
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      // Red dot
                      _buildDot(Color(0xFFFF5555)),
                      const SizedBox(width: 8.0),
                      // Yellow dot
                      _buildDot(Color(0xFFFFBA24)),
                      const SizedBox(width: 8.0),
                      // Green dot
                      _buildDot(Color(0xFF00CA3D)),
                    ],
                  ),
                ),
              ),
            ),
            // Content section
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 24.0),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.user.value.description.toString(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                          // color: colorScheme
                          //     .onSurface, // Use text color from the theme
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

// Helper widget for creating decorative dots
  Widget _buildDot(Color color) {
    return Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle, // Use a circular shape for the dots
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
          AccountIconButton(
            account: "linkedin",
            url:
                "https://www.linkedin.com/in/${controller.user.value.username}",
            iconData: FontAwesomeIcons.linkedin,
          ),
          AccountIconButton(
            account: "appstore",
            url: "https://apps.apple.com/us/developer/ahmet-ozkan/id1772304555",
            iconData: FontAwesomeIcons.appStoreIos,
          ),
          AccountIconButton(
            account: "instagram",
            url: "https://www.instagram.com/${controller.user.value.username}",
            iconData: FontAwesomeIcons.googlePlay,
          ),
          AccountIconButton(
            account: "github",
            url: "https://www.github.com/${controller.user.value.username}",
            iconData: FontAwesomeIcons.github,
          ),
          AccountIconButton(
            account: "medium",
            url: "https://www.medium.com/@${controller.user.value.username}",
            iconData: FontAwesomeIcons.medium,
          ),
          AccountIconButton(
            account: "x",
            url: "https://www.x.com/@${controller.user.value.username}",
            iconData: FontAwesomeIcons.xTwitter,
          ),
          AccountIconButton(
            account: "instagram",
            url: "https://www.instagram.com/${controller.user.value.username}",
            iconData: FontAwesomeIcons.instagram,
          ),
        ],
      ),
    );
  }

  Widget userTitle() {
    return Obx(() => Text(
          controller.user.value.title ?? '',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 17,
          ),
        ));
  }

  Widget userImage(BuildContext context) {
    return ClipOval(
      child: Image.network(
        "https://avatars.githubusercontent.com/u/65506828?s=400&u=ffc481d60828d5c04a6659a169cb68b70d259def&v=4",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Icon(
          Icons.person,
          size: 100,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget userName() {
    return Obx(
      () {
        final firstName = controller.user.value.firstName ?? 'First Name';
        final lastName = controller.user.value.lastName ?? 'Last Name';
        return Text(
          '$firstName $lastName',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
