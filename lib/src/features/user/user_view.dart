import 'package:ahmetozkanio/src/models/user.dart';
import 'package:ahmetozkanio/src/utils/constants/constant.dart';
import 'package:ahmetozkanio/src/utils/widgets/account_icon_button.dart';
import 'package:flutter/material.dart';
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
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            width: 1,
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
    return Obx(() => Visibility(
        visible: controller.user.value.socialAccounts != null &&
            controller.user.value.socialAccounts!.isNotEmpty,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (SocialAccount i
                  in controller.user.value.socialAccounts ?? [])
                AccountIconButton(
                  account: i.account,
                  url: i.url,
                  iconData: i.iconData,
                )
            ],
          ),
        )));
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
      child: Obx(() => Image.network(
            controller.user.value.profilePhoto ?? "",
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.person,
              size: 100,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          )),
    );
  }

  Widget userName() {
    return Obx(
      () {
        final firstName = controller.user.value.firstName ?? '';
        final lastName = controller.user.value.lastName ?? '';
        return Text(
          '$firstName $lastName',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
