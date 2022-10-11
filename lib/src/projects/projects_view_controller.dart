import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/project_model.dart';
import 'service/projects_service.dart';

class ProjectsViewController extends GetxController {
  RxList<Projects> projectsList = <Projects>[].obs;

  @override
  void onInit() {
    projectsFetchApi();
    super.onInit();
  }

  void projectsFetchApi() async {
    List<Projects>? items = await ProjectsService().getProjects();
    if (items != null) {}
    projectsList.value = items!;
  }
}
