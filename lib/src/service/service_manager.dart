class ServiceManager {
  final String _bases = "http://192.168.1.36:8000";

  final String _lang = "/en";

  final String _user = "/user/?format=json";

  String getUserUrl() => _bases + _lang + _user;
}
