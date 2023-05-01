import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/constants/constant.dart';
import 'package:web_site_ahmetozkanio/src/projects/service/projects_service.dart';
import 'package:web_site_ahmetozkanio/src/projects/widgets/github_button_widget.dart';

import '../../utils/custom_rect_tween.dart';
import '../model/project_model.dart';

class ProjectDetailView extends StatelessWidget {
  const ProjectDetailView(
      {Key? key, required this.project, required this.heroIndex})
      : super(key: key);
  final Projects project;
  final int heroIndex;
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Hero(
              tag: heroIndex,
              createRectTween: (begin, end) {
                return CustomRectTween(begin: begin!, end: end!);
              },
              child: Material(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  child: Container(
                    width: Constant().getMobileWidth(),
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          expandedHeight: 256.0,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    project.thumbnail ?? "",
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(16.0),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate([
                              constraints.maxWidth > Constant().getMobileWidth()
                                  ? projectWebWidget(context)
                                  : projectMobileWidget(context),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 32.0),
                                child: Text(project.projectDescription ?? ""),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }

  Row projectWebWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            projectName(),
            projectTools(),
          ],
        ),
        Row(
          children: [
            projectDate(),
            githubButton(
              context,
              project.github,
            ),
          ],
        ),
      ],
    );
  }

  Column projectMobileWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        projectName(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            projectTools(),
            Row(
              children: [
                projectDate(),
                githubButton(
                  context,
                  project.github,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  AutoSizeText projectDate() {
    return AutoSizeText(
      project.date ?? "",
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
      maxLines: 1,
    );
  }

  Row projectTools() {
    return Row(children: [
      if (project.tools != null)
        for (var i in project.tools!)
          Image.asset(
            width: 18.0,
            height: 18.0,
            "assets/logo/${i.id}.png",
          ),
    ]);
  }

  AutoSizeText projectName() {
    return AutoSizeText(
      project.projectName ?? "",
      maxLines: 1,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
    );
  }
}
