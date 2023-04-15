import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_site_ahmetozkanio/src/constants/constant.dart';
import 'package:web_site_ahmetozkanio/src/user/model/user_model.dart';

class UserService {
  Future<User?> getUser() async {
    try {
      Uri userUrl = Uri.parse(Constant().getUserUrl());
      var response = await http.get(userUrl);
      print(response);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        return User.fromJson(data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
