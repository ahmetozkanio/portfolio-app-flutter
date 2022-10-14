import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:web_site_ahmetozkanio/src/service/service_manager.dart';
import 'package:web_site_ahmetozkanio/src/user/model/user_model.dart';

class UserService {
  Future<User?> getUser() async {
    try {
      var response = await Dio().get(ServiceManager().getUserUrl());
      if (response.statusCode == 200) {
        print(response);
        Iterable iterable = json.decode(response.toString());
        List<User> projects =
            List<User>.from(iterable.map((model) => User.fromJson(model)));
        return projects[0];
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
