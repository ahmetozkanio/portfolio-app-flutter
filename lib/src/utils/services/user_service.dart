import 'package:ahmetozkanio/src/models/user.dart';
import 'package:ahmetozkanio/src/utils/constants/constant.dart';
import 'package:ahmetozkanio/src/utils/services/base_service.dart';

class UserService extends BaseService {
  Future<User?> getUser() async {
    var data = await get(Constant.getUserUrl());
    if (data != null) {
      return User.fromJson(data);
    }
    return null;
  }
}
