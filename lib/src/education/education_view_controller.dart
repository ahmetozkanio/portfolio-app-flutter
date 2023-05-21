import 'package:get/get.dart';

import 'education_model.dart';
import 'education_service.dart';

class EducationViewController extends GetxController {
  RxList<Education> educations = <Education>[].obs;
  @override
  void onInit() {
    super.onInit();
    educationsFetchApi();
  }

  void educationsFetchApi() async {
    var items = await EducationService().getEducations();
    if (items != null) {
      educations.value = items;
    }
  }
}
