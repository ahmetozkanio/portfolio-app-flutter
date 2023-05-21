import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/education/education_model.dart';
import 'package:web_site_ahmetozkanio/src/education/education_service.dart';
import 'package:web_site_ahmetozkanio/src/experience/experience_model.dart';
import 'package:web_site_ahmetozkanio/src/experience/experience_service.dart';

class ExperienceViewController extends GetxController {
  RxList<Experience> experiences = <Experience>[].obs;
  @override
  void onInit() {
    super.onInit();
    experiencesFetchApi();
  }

  void experiencesFetchApi() async {
    var items = await ExperienceService().getExperiences();
    if (items != null) {
      experiences.value = items;
    }
  }
}
