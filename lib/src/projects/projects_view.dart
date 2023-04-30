import 'package:auto_size_text/auto_size_text.dart';
import 'package:blur/blur.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:sticky_headers/sticky_headers.dart';
import 'package:web_site_ahmetozkanio/src/projects/model/project_model.dart';

import 'package:web_site_ahmetozkanio/src/projects/projects_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/utils/hero_dialog_route.dart';
import 'package:web_site_ahmetozkanio/src/utils/launch_url.dart';

import '../utils/custom_rect_tween.dart';

class ProjectsView extends GetView<ProjectsViewController> {
  ProjectsView({Key? key}) : super(key: key);
  // List<String> listHeader = [
  //   'HEADER1',
  //   'HEADER2',
  //   'HEADER3',
  // ];
  // ListView.builder(
  //           itemCount: listHeader.length,
  //           itemBuilder: (context, headerIndex) {
  //             return StickyHeader(
  //               header: Container(
  //                 height: 38.0,
  //                 color: Colors.white,
  //                 padding: EdgeInsets.symmetric(horizontal: 12.0),
  //                 alignment: Alignment.centerLeft,
  //                 child: Text(
  //                   listHeader[headerIndex],
  //                   style: const TextStyle(
  //                       color: Colors.purple,
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //               content: Container(
  //                 child:Obx(() =>  GridView.builder(
  //                   shrinkWrap: true,
  //                   physics: NeverScrollableScrollPhysics(),
  //                   itemCount: controller.projects.length,
  //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                     childAspectRatio: 1.4,
  //                     crossAxisSpacing: 5,
  //             mainAxisSpacing: 5,
  //             crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
  //           ),
  //           itemBuilder: (context, index) {
  //             return projectCard(index, context);
  //           },
  //         ),
  //       ),)
  //     );
  //   },
  //   shrinkWrap: true,

  // );
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return 

          Obx(() => GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.4,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
                        ),
                        itemCount: controller.projects.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext ctx, index) {
                          return projectCard(index, context);
                        }));
        
      },
    );
  }

  GestureDetector projectCard(int index, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        HeroDialogRoute(builder: (context) {
          return _ProjectPopupCard(
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
                  child:  Blur(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      blur: 9,
                      blurColor: Theme.of(context).primaryColor,
                      child: SizedBox(height: 38.0,),
                 
                      ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Card(
                      elevation: 24.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      color: Theme.of(context).secondaryHeaderColor.withAlpha(100),
                      child: 
                      IconButton(
                        hoverColor: Theme.of(context).secondaryHeaderColor,
                        splashRadius: 20.0,
                        onPressed: () => customLaunchUrl(
                            controller.projects[index].github ?? ""),
                        icon: SvgPicture.asset(
                          width: 18.0,
                          height: 18.0,
                          "assets/svg/github.svg",
                          color: Theme.of(context).iconTheme.color,
                          semanticsLabel: 'github',
                        ),
                      ),
                    ),
                  ),
                
                Positioned(
                  left: 8.0,
                  bottom: 8.0,
                  right: 36.0,
                  child:
                      AutoSizeText(
                        controller.projects[index].projectName.toString(),
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                          maxLines: 1,
                        )
                ),
                 Positioned(
                    bottom: 8,
                    right: 8,
                    child:  Row(
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


class _ProjectPopupCard extends StatelessWidget {
  const _ProjectPopupCard(
      {Key? key, required this.project, required this.heroIndex})
      : super(key: key);
  final Projects project;
  final int heroIndex;
  Widget build(BuildContext context) {
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
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    expandedHeight: 160.0,
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
                  SliverToBoxAdapter(
                    child:
                        Image.network('https://ghchart.rshah.org/ahmetozkanio'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
      