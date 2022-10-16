import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/user/model/user_model.dart';
import 'service/user_service.dart';

class UserViewController extends GetxController {
  Rx<User> user = User().obs;

  @override
  void onInit() {
    // userFetchApi();
    super.onInit();
  }

  void userFetchApi() async {
    User? item = await UserService().getUser();
    print(item);
    if (item != null) {}
    user.value = item!;
  }
}
