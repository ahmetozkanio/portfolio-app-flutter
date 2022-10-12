import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/projects/projects_view_controller.dart';

import 'project_detail/project_detail_view.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProjectsViewController projectsViewController =
        Get.put(ProjectsViewController());
    return Obx(
      () => GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          shrinkWrap: true,
          itemCount: projectsViewController.projectsList.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () => Get.toNamed(
                "/project/" +
                    projectsViewController.projectsList[index].category
                        .toString(),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          //    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9yXdQZCLY5K6W0QQknq9eeuuo4iwwbBFGHtw4yTVFgacLDwFdWbvNimvq6ZrFxvYAbYM&usqp=CAU"
                          image: NetworkImage(projectsViewController
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
                            projectsViewController
                                .projectsList[index].projectName
                                .toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
