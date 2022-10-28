import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_site_ahmetozkanio/src/certificates/model/certificate_model.dart';

import 'package:web_site_ahmetozkanio/src/projects/model/project_model.dart';
import 'package:web_site_ahmetozkanio/src/service/service_manager.dart';

class CertificatesService {
  Future<List<Certificate>?> getCertificates() async {
    try {
      var response =
          await http.get(Uri.parse(ServiceManager().getCertificateUrl()));
      if (response.statusCode == 200) {
        Iterable iterable = json.decode(response.body);
        List<Certificate> certificates = List<Certificate>.from(
            iterable.map((model) => Certificate.fromJson(model)));
        return certificates;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
