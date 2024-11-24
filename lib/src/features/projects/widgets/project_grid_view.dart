import 'package:ahmetozkanio/src/features/projects/widgets/project_card_widget.dart';
import 'package:ahmetozkanio/src/models/project.dart';

import 'package:delayed_display/delayed_display.dart';

import 'package:flutter/material.dart';

import '../../../utils/constants/constant.dart';

final class ProjectGridView extends StatelessWidget {
  final List<Project> projects;

  ProjectGridView({
    required this.projects,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount =
            constraints.maxWidth > Constant.getMobileWidth() ? 3 : 2;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: crossAxisCount,
          ),
          itemCount: projects.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return DelayedDisplay(
              delay: const Duration(milliseconds: 200),
              child: ProjectCard(
                project: projects[index],
              ),
            );
          },
        );
      },
    );
  }
}
