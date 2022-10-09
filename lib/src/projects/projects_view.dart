import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/projects/projects_view_controller.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProjectsViewController projectsViewController =
        Get.put(ProjectsViewController());
    return Obx(
      () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          shrinkWrap: true,
          itemCount: projectsViewController.projectsList.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9yXdQZCLY5K6W0QQknq9eeuuo4iwwbBFGHtw4yTVFgacLDwFdWbvNimvq6ZrFxvYAbYM&usqp=CAU"),
                  ),
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                  projectsViewController.projectsList[index].projectName ?? ""),
            );
          }),
    );
  }
}
