class ServiceManager {
  final String _base = "http://192.168.1.34:8000";
  final String _format = "/?format=json";
  final String _lang = "/en";

  final String _user = "/user";
  final String _project = "/projects";

  String getBaseUrl() => _base;

  String getUserUrl() => _base + _user + _format;
  String getProjectUrl() => _base + _project + _format;
}
