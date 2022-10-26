import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:web_site_ahmetozkanio/src/projects/model/project_model.dart';
import 'package:web_site_ahmetozkanio/src/service/service_manager.dart';

class ProjectsService {
  Future<List<Project>?> getProjects() async {
    try {
      var response =
          await http.get(Uri.parse(ServiceManager().getProjectUrl()));
      if (response.statusCode == 200) {
        Iterable iterable = json.decode(response.body);
        List<Project> projects = List<Project>.from(
            iterable.map((model) => Project.fromJson(model)));
        return projects;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
