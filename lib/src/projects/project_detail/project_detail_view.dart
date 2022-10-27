import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/projects/model/project_model.dart';
import 'package:web_site_ahmetozkanio/src/projects/project_detail/project_detail_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/service/service_manager.dart';

class ProjectDetailView extends GetView<ProjectDetailViewController> {
  ProjectDetailView({Key? key}) : super(key: key);

  Project project = Get.arguments;
  String url = ServiceManager().getBaseUrl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Hero(
        tag: project.slug ?? "",
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: 6.0,
              expandedHeight: MediaQuery.of(context).size.height / 2,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    project.name ?? "",
                    textAlign: TextAlign.center,
                  ),
                  background: CarouselSlider.builder(
                    itemCount: project.projectImages?.length ?? 0,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      child: Image.network(url +
                          '/' +
                          project.projectImages![itemIndex].toString()),
                    ),
                    options: CarouselOptions(),
                  )
                  // Container(
                  //   decoration: BoxDecoration(
                  //     // borderRadius: BorderRadius.only(
                  //     //   topLeft: Radius.circular(0),
                  //     //   topRight: Radius.circular(0),
                  //     //   bottomLeft: Radius.circular(24.0),
                  //     //   bottomRight: Radius.circular(24.0),
                  //     // ),
                  //     image: DecorationImage(
                  //       image: NetworkImage(url + project.image!),
                  //       fit: BoxFit.fitHeight,
                  //     ),
                  //   ),
                  // ),
                  ),
            ),
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 45,
            //     child: Center(
            //       child: Text(homePageCardModel.title),
            //     ),
            //   ),
            // ),

            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Text(
                          project.description ?? "",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        for (var item in project.projectImages!)
                          Image.network(url + item.projectImages!),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // SliverPadding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 24.0,
            //   ),
            //   sliver: SliverGrid(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       mainAxisSpacing: 8.0,
            //       crossAxisSpacing: 8.0,
            //       childAspectRatio: 1.0,
            //     ),
            //     delegate: SliverChildBuilderDelegate(
            //       (context, index) {
            //         return cardComponentRoute1(
            //           context,
            //           homePageCardModel.detailModel![index]!.title,
            //           homePageCardModel.detailModel![index]!.image,
            //           CardDetailRoute2(
            //             homePageCardModel: homePageCardModel,
            //             detailModel: homePageCardModel.detailModel![index]!,
            //           ),
            //         );
            //       },
            //       childCount: homePageCardModel.detailModel!.length,
            //     ),
            //   ),
            // ),
            SliverPadding(padding: EdgeInsets.all(8.0))
          ],
        ),
      ),
    );
  }
}
