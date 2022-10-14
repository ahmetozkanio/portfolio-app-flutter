import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'model/user_model.dart';
import 'user_view_controller.dart';

class UserView extends GetView<UserViewController> {
  UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = controller.user.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 145,
              height: 145,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/profile_photo.jpg'),
                    fit: BoxFit.fitWidth),
                border: Border.all(
                  width: 4.0,
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(145, 145)),
              ),
            ),
            SizedBox(
              width: 24.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ahmet Ozkan',
                  style: TextStyle(
                    fontSize: 46,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Computer Engineer',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/svg/github.svg",
                            color: Theme.of(context).primaryColor,
                            semanticsLabel: 'github')),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/svg/linkedin.svg",
                            color: Theme.of(context).primaryColor,
                            semanticsLabel: 'linkedin')),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/svg/whatsapp.svg",
                            color: Theme.of(context).primaryColor,
                            semanticsLabel: 'whatsapp')),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/svg/medium.svg",
                            color: Theme.of(context).primaryColor,
                            semanticsLabel: 'medium')),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/svg/twitter.svg",
                            color: Theme.of(context).primaryColor,
                            semanticsLabel: 'twitter')),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/svg/instagram.svg",
                            color: Theme.of(context).primaryColor,
                            semanticsLabel: 'instagram'))
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
