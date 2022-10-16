import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:web_site_ahmetozkanio/src/projects/projects_view_controller.dart';

class ProjectsView extends GetView<ProjectsViewController> {
  ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.projectCategory.length,
      itemBuilder: (context, index) {
        return StickyHeader(
          header: Column(
            children: [
              Divider(),
              Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                  child: Text(
                    controller.projectCategory[index],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Divider()
            ],
          ),
          content: Obx(() => GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                itemCount: index == 0
                    ? controller.mobileList.length
                    : index == 1
                        ? controller.webList.length
                        : controller.desktopList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed("/project/"),
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
                                fit: BoxFit.contain,
                                //    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9yXdQZCLY5K6W0QQknq9eeuuo4iwwbBFGHtw4yTVFgacLDwFdWbvNimvq6ZrFxvYAbYM&usqp=CAU"
                                image: NetworkImage(controller
                                    .projectsList[index].images![2].imageUrl
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 219, 219, 219),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8)),
                                    ),
                                    height: 36,
                                  )),
                              Positioned(
                                top: 6.0,
                                right: 6.0,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/logo/flutter.png",
                                      width: 18.0,
                                      height: 18.0,
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Image.asset(
                                      "assets/logo/swift.png",
                                      width: 18.0,
                                      height: 18.0,
                                    ),
                                  ],
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
                                child: Text(
                                  controller.projectsList[index].projectName
                                      .toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          )),
                    ),
                  );
                },
              )),
        );
      },
      shrinkWrap: true,
    );
  }
}
