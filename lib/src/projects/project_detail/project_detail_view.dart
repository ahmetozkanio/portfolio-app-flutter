import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/retry.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';
import 'package:web_site_ahmetozkanio/src/projects/model/project_model.dart';
import 'package:web_site_ahmetozkanio/src/projects/project_detail/project_detail_view_controller.dart';
import 'package:web_site_ahmetozkanio/src/service/service_manager.dart';

class ProjectDetailView extends GetView<ProjectDetailViewController> {
  ProjectDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.project.name ?? ""),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return detailPageMax(context, constraints);
          } else {
            return detailPageMin(context, constraints);
          }
        },
      ),
    );
  }

  SingleChildScrollView detailPageMax(
      BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 11,
            child: Container(
              width: 650,
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  description(),
                  // Divider(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     for (var item in controller.project.projectTools!)
                  //       Image.asset('assets/logo/${item.toolName}.png')
                  //   ],
                  // ),
                  Divider(),
                  images(context, constraints)
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Column(
                children: [
                  Text('Github Page'),
                  githubButton(context),
                  Divider(),
                  Text('Tools'),
                  for (var item in controller.project.projectTools!)
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset('assets/logo/${item.toolName}.png'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconButton githubButton(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/svg/github.svg",
            color: Theme.of(context).primaryColor, semanticsLabel: 'github'));
  }

  Html description() => Html(data: controller.project.description ?? "");

  SingleChildScrollView detailPageMin(
      BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 650,
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              githubButton(context),
              Divider(),
              description(),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var item in controller.project.projectTools!)
                    Image.asset('assets/logo/${item.toolName}.png')
                ],
              ),
              Divider(),
              images(context, constraints)
            ],
          ),
        ),
      ),
    );
  }

  Widget images(BuildContext context, BoxConstraints constraints) {
    return Container(
      width: 250,
      height: 250,
      child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
                controller.project.projectImages![index].projectImages!),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            heroAttributes: PhotoViewHeroAttributes(
                tag: controller.project.projectImages![index].projectImages!),
          );
        },
        itemCount: controller.project.projectImages!.length,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded /
                      event.expectedTotalBytes!.toInt(),
            ),
          ),
        ),
        // backgroundDecoration: widget.backgroundDecoration,
        // pageController: widget.pageController,
        // onPageChanged: onPageChanged,
      ),
    );

    // ScrollConfiguration(
    //   behavior: ScrollConfiguration.of(context).copyWith(
    //     dragDevices: {
    //       PointerDeviceKind.touch,
    //       PointerDeviceKind.mouse,
    //     },
    //   ),
    //   child: Column(
    //     children: [
    //       // for (var item in controller.project.projectImages!)
    //       //   PhotoView(
    //       //     imageProvider: NetworkImage(
    //       //       controller.url + item.projectImages!,
    //       //     ),
    //       //   )
    //     ],
    //   ),
    // );
  }
}
