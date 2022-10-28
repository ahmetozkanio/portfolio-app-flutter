import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/service/service_manager.dart';
import 'package:web_site_ahmetozkanio/src/user/model/user_model.dart';
import 'service/user_service.dart';

class UserViewController extends GetxController {
  RxBool userLoading = true.obs;
  var user = User().obs;
  var url;
  RxInt pageIndex = 0.obs;
  PageController pageController = PageController();
  // int _currentPage = 0;
  // Timer? _timer;
  // PageController pageController = PageController(
  //   initialPage: 0,
  // );

  @override
  void onInit() {
    userImagesPage();

    url = ServiceManager().getBaseUrl();
    userFetchApi();
    super.onInit();
  }

  @override
  void onClose() {
    // _timer?.cancel();
    super.onClose();
  }

  void userImagesPage() {
    // _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
    //   if (_currentPage < 2) {
    //     _currentPage++;
    //   } else {
    //     _currentPage = 0;
    //   }

    // pageController.animateToPage(
    //   _currentPage,
    //   duration: Duration(milliseconds: 350),
    //   curve: Curves.easeIn,
    // );
  }

  void userFetchApi() async {
    try {
      userLoading.value = true;
      User? item = await UserService().getUser();

      if (item != null) {
        user.value = item;
      }
    } finally {
      userLoading.value = false;
    }
  }
}
