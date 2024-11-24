import 'package:ahmetozkanio/src/utils/launch_url.dart';
import 'package:flutter/material.dart';

class AccountIconButton extends StatelessWidget {
  const AccountIconButton({
    super.key,
    required this.account,
    required this.url,
    required this.iconData,
    this.isFilled = false,
  });

  final String account;
  final String url;
  final IconData iconData;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isFilled
          ? BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(100.0))
          : null,
      child: IconButton(
          tooltip: "Open $account",
          splashRadius: 10.0,
          onPressed: () {
            customLaunchUrl(url);
          },
          icon: Icon(
            iconData,
            size: isFilled ? 20 : 16,
            // color: Theme.of(context).colorScheme.secondaryContainer,
          )),
    );
  }
}
