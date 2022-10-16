import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:web_site_ahmetozkanio/src/projects/model/project_model.dart';

class ProjectsService {
  Future<List<Projects>?> getProjects() async {
    try {
      var response = await Dio().get(
          'https://raw.githubusercontent.com/ahmetozkanio/custom-api-public/main/projects.json');
      if (response.statusCode == 200) {
        Iterable iterable = json.decode(response.toString());
        List<Projects> projects = List<Projects>.from(
            iterable.map((model) => Projects.fromJson(model)));
        return projects;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
