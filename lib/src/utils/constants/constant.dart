class Constant {
  static const double _mobileWidth = 600.0;
  static double getMobileWidth() => _mobileWidth;

  // Services
  static const String _base =
      'https://raw.githubusercontent.com/ahmetozkanio/custom-api-public/main/my-site';

  static const String _project = "/projects.json";
  static const String _indieProject = "/indie-projects.json";

  static const String _user = "/user.json";
  static const String _education = "/education.json";
  static const String _experience = "/experience.json";

  static String getBaseUrl() => _base;

  static String getUserUrl() => _base + _user;
  static String getProjectUrl() => _base + _project;
  static String getIndieProjectUrl() => _base + _indieProject;

  static String getCertificateUrl() => _base + _project;
  static String getEducationUrl() => _base + _education;
  static String getExperienceUrl() => _base + _experience;
}
