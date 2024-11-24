import 'package:ahmetozkanio/src/models/experience.dart';
import 'package:ahmetozkanio/src/utils/services/experience_service.dart';
import 'package:get/get.dart';

final class ExperienceViewController extends GetxController {
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
