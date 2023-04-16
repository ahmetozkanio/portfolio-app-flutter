import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web_site_ahmetozkanio/src/home/home.dart';

void main() async {
  await GetStorage.init();
  runApp(Home());
}
