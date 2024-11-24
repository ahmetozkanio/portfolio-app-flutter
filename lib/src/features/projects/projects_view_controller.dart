import 'package:get/get.dart';
import '../../models/project.dart';
import '../../utils/services/projects_service.dart';

class ProjectsViewController extends GetxController {
  RxList<Project> projects = <Project>[].obs;
  RxList<Project> indieProjects = <Project>[].obs;

  @override
  void onInit() {
    super.onInit();
    getIndieProjects();
    getProjects();
  }

  void getProjects() async {
    var items = await ProjectsService().getProjects();
    if (items != null) {
      projects.value = items;
    }
  }

  void getIndieProjects() async {
    var items = await ProjectsService().getIndieProjects();
    if (items != null) {
      indieProjects.value = items;
    }
  }
}
