import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(String url) async {
  var _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
