import 'package:auto_size_text/auto_size_text.dart';
import 'package:blur/blur.dart';
import 'package:delayed_display/delayed_display.dart';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/projects/detail/project_detail_view.dart';
import 'package:web_site_ahmetozkanio/src/projects/model/project_model.dart';

import 'package:web_site_ahmetozkanio/src/projects/projects_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/projects/service/projects_service.dart';
import 'package:web_site_ahmetozkanio/src/utils/hero_dialog_route.dart';
import 'package:web_site_ahmetozkanio/src/utils/launch_url.dart';

import '../constants/constant.dart';
import '../utils/custom_rect_tween.dart';
import 'widgets/github_button_widget.dart';

class ProjectsView extends GetView<ProjectsViewController> {
  ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Obx(() => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount:
                  constraints.maxWidth > Constant().getMobileWidth() ? 3 : 2,
            ),
            itemCount: controller.projects.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext ctx, index) {
              return DelayedDisplay(
                  delay: Duration(milliseconds: 500),
                  child: projectCard(index, context));
            }));
      },
    );
  }

  GestureDetector projectCard(int index, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        HeroDialogRoute(builder: (context) {
          return ProjectDetailView(
              project: controller.projects[index], heroIndex: index);
        }),
      ),
      child: Hero(
        tag: index,
        createRectTween: (begin, end) =>
            CustomRectTween(begin: begin!, end: end!),
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
                  image: NetworkImage(
                      controller.projects[index].thumbnail.toString()),
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
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    blur: 9,
                    blurColor: Get.isDarkMode
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).primaryColor,
                    child: SizedBox(
                      height: 38.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child:
                      githubButton(context, controller.projects[index].github),
                ),
                Positioned(
                    left: 8.0,
                    bottom: 8.0,
                    right: 52.0,
                    child: AutoSizeText(
                      controller.projects[index].projectName.toString(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      maxLines: 1,
                    )),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Row(
                    children: [
                      if (controller.projects[index].tools != null)
                        for (var i in controller.projects[index].tools!)
                          Image.asset(
                            width: 16.0,
                            height: 16.0,
                            "assets/logo/${i.id}.png",
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Card(
        //   color: Theme.of(context).secondaryHeaderColor,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         image: NetworkImage(
        //           controller.projects[index].thumbnail ?? "",
        //         ),
        //         fit: BoxFit.contain,
        //       ),
        //     ),
        //     child: Text(""),
        //   ),
        // ),
      ),
    );
  }
}
