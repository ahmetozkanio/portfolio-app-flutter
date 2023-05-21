import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_site_ahmetozkanio/src/constants/constant.dart';
import 'education_model.dart';

class EducationService {
  Future<List<Education>?> getEducations() async {
    try {
      var response = await http.get(Uri.parse(Constant().getEducationUrl()));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        var educations = data["educations"] as List;
        return educations
            .map<Education>((json) => Education.fromJson(json))
            .toList();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
