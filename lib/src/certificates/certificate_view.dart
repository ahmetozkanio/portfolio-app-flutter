// import 'package:blur/blur.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'certificate_view_controller.dart';

// class CertificateView extends GetView<CertificatesViewController> {
//   const CertificateView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//       return Obx(
//         () => controller.certificateLoading.value
//             ? CircularProgressIndicator()
//             : GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   childAspectRatio: 1.4,
//                   crossAxisSpacing: 5,
//                   mainAxisSpacing: 5,
//                   crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
//                 ),
//                 shrinkWrap: true,
//                 itemCount: controller.certificates.length,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: Container(
//                       // width: 250,
//                       // height: 150,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                             fit: BoxFit.fill,
//                             //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9yXdQZCLY5K6W0QQknq9eeuuo4iwwbBFGHtw4yTVFgacLDwFdWbvNimvq6ZrFxvYAbYM&usqp=CAU"
//                             image: NetworkImage(controller.baseUrl +
//                                 controller.certificates[index].certificateImage
//                                     .toString()),
//                           ),
//                           // color: Colors.amber,
//                           borderRadius: BorderRadius.circular(4)),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             bottom: 0,
//                             right: 0,
//                             left: 0,
//                             child: Blur(
//                                 blur: 9,
//                                 // blurColor:
//                                 //     Theme.of(context).primaryColor,
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: Color.fromARGB(54, 219, 219, 219),
//                                     borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(8),
//                                         bottomRight: Radius.circular(8)),
//                                   ),
//                                   height: 32,
//                                 )),
//                           ),
//                           Positioned(
//                             top: 6.0,
//                             left: 6.0,
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: Image.asset(
//                                       "assets/logo/${controller.certificates[index].companyName!.toLowerCase()}.png",
//                                       // width: 32.0,
//                                       height: 32.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 0,
//                             right: 0,
//                             child: IconButton(
//                               onPressed: () => customLaunchUrl(controller
//                                       .certificates[index].certificateUrl ??
//                                   ''),
//                               icon: SvgPicture.asset(
//                                 "assets/svg/link.svg",
//                                 width: 48,
//                                 height: 48,
//                                 color: Theme.of(context).primaryColor,
//                                 semanticsLabel: 'url',
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             left: 8,
//                             bottom: 8,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   controller.certificates[index].name
//                                       .toString(),
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//       );
//     });
//   }
// }
