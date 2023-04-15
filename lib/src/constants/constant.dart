


class Constant{
  final double _mobileWidth = 600.0;
  double getMobileWidth() => _mobileWidth;

  // Services
  final String _base =
      'https://raw.githubusercontent.com/ahmetozkanio/custom-api-public/main';

  final String _project = "/projects.json";
  final String _user = "/my-site/user.json";

  String getBaseUrl() => _base;

  String getUserUrl() => _base + _user;
  String getProjectUrl() => _base + _project;
  String getCertificateUrl() => _base + _project;
}