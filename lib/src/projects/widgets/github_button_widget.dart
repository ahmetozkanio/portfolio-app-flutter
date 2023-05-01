import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/launch_url.dart';

Card githubButton(BuildContext context, String? url) {
  return Card(
    elevation: 24.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32.0),
    ),
    color: Theme.of(context).secondaryHeaderColor.withAlpha(100),
    child: IconButton(
      hoverColor: Theme.of(context).secondaryHeaderColor,
      splashRadius: 20.0,
      onPressed: () => customLaunchUrl(url ?? ""),
      icon: SvgPicture.asset(
        width: 18.0,
        height: 18.0,
        "assets/svg/github.svg",
        color: Theme.of(context).iconTheme.color,
        semanticsLabel: 'github',
      ),
    ),
  );
}
