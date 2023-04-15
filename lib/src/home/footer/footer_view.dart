import 'package:flutter/material.dart';

class FooterView extends StatelessWidget {
  const FooterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32.0,
        top: 128.0,
      ),
      child: Text(
        "© ahmetozkanio. 2022 All rigths reserved",
      ),
    );
  }
}
