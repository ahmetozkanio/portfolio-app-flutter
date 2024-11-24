import 'package:ahmetozkanio/src/models/project.dart';
import 'package:ahmetozkanio/src/utils/constants/constant.dart';
import 'package:ahmetozkanio/src/utils/services/base_service.dart';

class ProjectsService extends BaseService {
  Future<List<Project>?> getProjects() async {
    var data = await get(Constant.getProjectUrl());
    if (data != null) {
      var projects = data["projects"] as List;
      return projects.map<Project>((json) => Project.fromJson(json)).toList();
    }
    return null;
  }

  Future<List<Project>?> getIndieProjects() async {
    var data = await get(Constant.getIndieProjectUrl());
    if (data != null) {
      var projects = data["projects"] as List;
      return projects.map<Project>((json) => Project.fromJson(json)).toList();
    }
    return null;
  }
}
