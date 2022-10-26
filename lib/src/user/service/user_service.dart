import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:web_site_ahmetozkanio/src/service/service_manager.dart';
import 'package:web_site_ahmetozkanio/src/user/model/user_model.dart';

class UserService {
  Future<User?> getUser() async {
    try {
      Uri userUrl = Uri.parse(ServiceManager().getUserUrl());
      var response = await http.get(userUrl);
      print(response);
      if (response.statusCode == 200) {
        Iterable iterable = json.decode(response.body);

        List<User> user =
            List<User>.from(iterable.map((model) => User.fromJson(model)));
        return user[0];
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
