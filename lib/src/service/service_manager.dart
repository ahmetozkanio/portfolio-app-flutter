class ServiceManager {
  final String _bases = "https://ahmetozkanio.herokuapp.com";

  final String _lang = "/en";

  final String _user = "/user";

  final String _format = "/?format=json";

  String getUserUrl() => _bases + _lang + _user + _format;
}
