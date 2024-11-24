import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseService {
  Future<Map<String, dynamic>?> get(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error during HTTP GET: $e");
    }
    return null;
  }
}
