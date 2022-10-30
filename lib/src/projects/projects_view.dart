import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:web_site_ahmetozkanio/src/projects/projects_view_controller.dart';

class ProjectsView extends GetView<ProjectsViewController> {
  ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Obx(
          () => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
            ),
            itemCount: controller.projectsList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () => Get.toNamed(
                    "/project/${controller.projectsList[index].slug}",
                    arguments: controller.projectsList[index]),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                      // width: 250,
                      // height: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9yXdQZCLY5K6W0QQknq9eeuuo4iwwbBFGHtw4yTVFgacLDwFdWbvNimvq6ZrFxvYAbYM&usqp=CAU"
                            image: NetworkImage(controller.baseUrl +
                                controller.projectsList[index].image
                                    .toString()),
                          ),
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(4)),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Blur(
                                blur: 9,
                                // blurColor:
                                //     Theme.of(context).primaryColor,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(54, 219, 219, 219),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8)),
                                  ),
                                  height: 32,
                                )),
                          ),
                          Positioned(
                            top: 6.0,
                            right: 6.0,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  for (var item in controller
                                      .projectsList[index].projectTools!)
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                        "assets/logo/${item.toolName}.png",
                                        width: 16.0,
                                        height: 16.0,
                                      ),
                                    ),

                                  // Image.asset(
                                  //   "assets/logo/swift.png",
                                  //   width: 18.0,
                                  //   height: 18.0,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/svg/github.svg",
                                color: Colors.red,
                                semanticsLabel: 'github',
                              ),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            bottom: 8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.projectsList[index].name
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              );
            },
          ),
        );
      },
    );
  }
}


// LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         return 
        
        
        
//         ListView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: 3,
//             shrinkWrap: true,
//             itemBuilder: (context, indexCategory) {
//               return StickyHeader(
//                 header: Column(
//                   children: [
//                     Divider(),
//                     Padding(
//                         padding: const EdgeInsets.only(left: 8.0, top: 4.0),
//                         child: Text(
//                           controller.projectCategory[indexCategory],
//                           style: const TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         )),
//                     Divider()
//                   ],
//                 ),
//                 content: Obx(
//                   () => GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       childAspectRatio: 1.4,
//                       crossAxisSpacing: 5,
//                       mainAxisSpacing: 5,
//                       crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
//                     ),
//                     itemCount: indexCategory == 0
//                         ? controller.mobileList.length
//                         : indexCategory == 1
//                             ? controller.webList.length
//                             : controller.desktopList.length,
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemBuilder: (BuildContext ctx, index) {
//                       RxList<Project> project;
//                       if (indexCategory == 0) {
//                         project = controller.mobileList;
//                       } else if (indexCategory == 1) {
//                         project = controller.webList;
//                       } else {
//                         project = controller.desktopList;
//                       }
//                       return GestureDetector(
//                         onTap: () => Get.toNamed(
//                             "/project/${project[index].slug}",
//                             arguments: project[index]),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: Container(
//                               // width: 250,
//                               // height: 150,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     fit: BoxFit.fitWidth,
//                                     //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9yXdQZCLY5K6W0QQknq9eeuuo4iwwbBFGHtw4yTVFgacLDwFdWbvNimvq6ZrFxvYAbYM&usqp=CAU"
//                                     image: NetworkImage(controller.baseUrl +
//                                         project[index].image.toString()),
//                                   ),
//                                   // color: Colors.amber,
//                                   borderRadius: BorderRadius.circular(4)),
//                               child: Stack(
//                                 children: [
//                                   Positioned(
//                                     bottom: 0,
//                                     right: 0,
//                                     left: 0,
//                                     child: Blur(
//                                         blur: 9,
//                                         // blurColor:
//                                         //     Theme.of(context).primaryColor,
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             color: Color.fromARGB(
//                                                 54, 219, 219, 219),
//                                             borderRadius: BorderRadius.only(
//                                                 bottomLeft: Radius.circular(8),
//                                                 bottomRight:
//                                                     Radius.circular(8)),
//                                           ),
//                                           height: 32,
//                                         )),
//                                   ),
//                                   Positioned(
//                                     top: 6.0,
//                                     right: 6.0,
//                                     child: SingleChildScrollView(
//                                       child: Column(
//                                         children: [
//                                           for (var item
//                                               in project[index].projectTools!)
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(4.0),
//                                               child: Image.asset(
//                                                 "assets/logo/${item.toolName}.png",
//                                                 width: 16.0,
//                                                 height: 16.0,
//                                               ),
//                                             ),

//                                           // Image.asset(
//                                           //   "assets/logo/swift.png",
//                                           //   width: 18.0,
//                                           //   height: 18.0,
//                                           // ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 0,
//                                     left: 0,
//                                     child: IconButton(
//                                       onPressed: () {},
//                                       icon: SvgPicture.asset(
//                                         "assets/svg/github.svg",
//                                         color: Colors.red,
//                                         semanticsLabel: 'github',
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     left: 8,
//                                     bottom: 8,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           project[index].name.toString(),
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(color: Colors.black),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               );
//             });
//       },
//     );