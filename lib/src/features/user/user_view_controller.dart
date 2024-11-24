import 'package:ahmetozkanio/src/models/user.dart';
import 'package:get/get.dart';
import '../../utils/services/user_service.dart';

class UserViewController extends GetxController {
  final user = User().obs;

  @override
  void onInit() {
    super.onInit();
    userFetchApi();
  }

  void userFetchApi() async {
    try {
      User? item = await UserService().getUser();

      user.value = item ?? User();
    } finally {}
  }
}
