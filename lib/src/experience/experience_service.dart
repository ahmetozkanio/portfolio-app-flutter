import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_site_ahmetozkanio/src/constants/constant.dart';
import 'experience_model.dart';

class ExperienceService {
  Future<List<Experience>?> getExperiences() async {
    try {
      var response = await http.get(Uri.parse(Constant().getExperienceUrl()));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        var experiences = data["experiences"] as List;
        return experiences
            .map<Experience>((json) => Experience.fromJson(json))
            .toList();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
