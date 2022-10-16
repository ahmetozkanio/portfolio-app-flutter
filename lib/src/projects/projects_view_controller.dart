import 'package:get/get.dart';

import 'model/project_model.dart';
import 'service/projects_service.dart';

class ProjectsViewController extends GetxController {
  RxList<Projects> projectsList = <Projects>[].obs;
  RxList<Projects> mobileList = <Projects>[].obs;
  RxList<Projects> webList = <Projects>[].obs;
  RxList<Projects> desktopList = <Projects>[].obs;

  List<String> projectCategory = ['Mobile', 'Web', 'Desktop'];
  @override
  void onInit() {
    projectsFetchApi();
    super.onInit();
  }

  void projectsFetchApi() async {
    List<Projects>? items = await ProjectsService().getProjects();
    if (items != null) {
      projectsList.value = items;
      for (var item in items) {
        if (item.category.toString().toLowerCase() ==
            projectCategory[0].toLowerCase()) {
          mobileList.add(item);
        } else if (item.category.toString().toLowerCase() ==
            projectCategory[1].toLowerCase()) {
          webList.add(item);
        } else if (item.category.toString().toLowerCase() ==
            projectCategory[2].toLowerCase()) {
          desktopList.add(item);
        }
      }
    }
  }
}
