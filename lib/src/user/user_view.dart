import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
                child: Text(
                    "asfas fasf safk alsfk alskf laskf lask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasflask lasfklasfl")),
          ],
        ),
      ),
    );
  }

  Row userAccounts(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

  Text userTitle() {
    return Text(
      controller.user.value.title.toString(),
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 22,
      ),
    );
  }

  Text userName() {
    return Text(
      'Ahmet Ozkan',
      style: TextStyle(
        fontSize: 46,
      ),
    );
  }

  Container userImage(BuildContext context) {
    return Container(
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
    );
  }
}
