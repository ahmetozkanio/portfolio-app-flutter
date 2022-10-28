import 'package:get/get.dart';

import '../../service/service_manager.dart';
import '../model/project_model.dart';

class ProjectDetailViewController extends GetxController {
  Project project = Get.arguments;
  String url = ServiceManager().getBaseUrl();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
