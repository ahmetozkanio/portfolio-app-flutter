import 'package:get/get.dart';

final class HomeViewController extends GetxController {
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void indexChange(index) {
    selectedIndex.value = index;
  }
}
