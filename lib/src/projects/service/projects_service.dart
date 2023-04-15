import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_site_ahmetozkanio/src/constants/constant.dart';

import 'package:web_site_ahmetozkanio/src/projects/model/project_model.dart';

class ProjectsService {
  Future<List<Projects>?> getProjects() async {
    try {
      var response =
          await http.get(Uri.parse(Constant().getProjectUrl()));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
      
       var projects = data["projects"] as List;
      return projects.map<Projects>((json) => Projects.fromJson(json)).toList();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
