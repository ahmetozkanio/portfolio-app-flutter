import 'package:ahmetozkanio/src/features/projects/projects_view_controller.dart';
import 'package:ahmetozkanio/src/features/projects/widgets/project_grid_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

final class IndieProjectView extends StatelessWidget {
  const IndieProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectsViewController controller = Get.find<ProjectsViewController>();
    return ProjectGridView(projects: controller.indieProjects);
  }
}
