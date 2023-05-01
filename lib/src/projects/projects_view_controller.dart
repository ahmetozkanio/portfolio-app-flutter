import 'package:get/get.dart';
import 'model/project_model.dart';
import 'service/projects_service.dart';

class ProjectsViewController extends GetxController {
  RxList<Projects> projects = <Projects>[].obs;

  @override
  void onInit() {
    super.onInit();
    projectsFetchApi();
  }

  void projectsFetchApi() async {
    var items = await ProjectsService().getProjects();
    if (items != null) {
      projects.value = items;
    }
  }
}
