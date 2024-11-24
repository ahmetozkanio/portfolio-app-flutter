import 'package:ahmetozkanio/src/models/experience.dart';
import 'package:ahmetozkanio/src/utils/constants/constant.dart';
import 'package:ahmetozkanio/src/utils/services/base_service.dart';

class ExperienceService extends BaseService {
  Future<List<Experience>?> getExperiences() async {
    var data = await get(Constant.getExperienceUrl());
    if (data != null) {
      var experiences = data["experiences"] as List;
      return experiences
          .map<Experience>((json) => Experience.fromJson(json))
          .toList();
    }
    return null;
  }
}
