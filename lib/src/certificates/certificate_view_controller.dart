// import 'package:get/get.dart';
// import 'package:web_site_ahmetozkanio/src/certificates/service/certificate_service.dart';
// import 'model/certificate_model.dart';

// class CertificatesViewController extends GetxController {
//   RxBool certificateLoading = true.obs;
//   String baseUrl = '';
//   RxList<Certificate> certificates = <Certificate>[].obs;

//   @override
//   void onInit() {
//     getCertificateList();
//     super.onInit();
//   }

//   void getCertificateList() async {
//     try {
//       certificateLoading.value = true;
//       var items = await CertificatesService().getCertificates();

//       if (items != null) {
//         certificates.value = items;
//       }
//     } finally {
//       certificateLoading.value = false;
//     }
//   }
// }
