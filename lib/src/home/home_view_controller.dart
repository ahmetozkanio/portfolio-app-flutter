import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void indexChange(index) {
    selectedIndex.value = index;
  }
}
