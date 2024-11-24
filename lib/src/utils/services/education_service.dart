import 'package:ahmetozkanio/src/models/education.dart';
import 'package:ahmetozkanio/src/utils/constants/constant.dart';

import 'base_service.dart';

class EducationService extends BaseService {
  Future<List<Education>?> getEducations() async {
    var data = await get(Constant.getEducationUrl());
    if (data != null) {
      var educations = data["educations"] as List;
      return educations
          .map<Education>((json) => Education.fromJson(json))
          .toList();
    }
    return null;
  }
}
