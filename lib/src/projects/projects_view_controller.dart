import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/service/service_manager.dart';

import 'model/project_model.dart';
import 'service/projects_service.dart';

class ProjectsViewController extends GetxController {
  var baseUrl = ServiceManager().getBaseUrl();

  RxList<Project> projectsList = <Project>[].obs;
  RxList<Project> mobileList = <Project>[].obs;
  RxList<Project> webList = <Project>[].obs;
  RxList<Project> desktopList = <Project>[].obs;

  List<String> projectCategory = ['mobile', 'web', 'desktop'];
  @override
  void onInit() {
    projectsFetchApi();
    super.onInit();
  }

  void projectsFetchApi() async {
    List<Project>? items = await ProjectsService().getProjects();
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
