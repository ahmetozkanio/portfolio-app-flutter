import 'package:get/get.dart';

import '../../models/education.dart';
import '../../utils/services/education_service.dart';

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
