import 'package:ahmetozkanio/src/features/education/education_view_controller.dart';
import 'package:ahmetozkanio/src/utils/constants/constant.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

final class EducationView extends GetView<EducationViewController> {
  EducationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
        delay: Duration(milliseconds: 200),
        child: Center(
            child: Container(
          width: Constant.getMobileWidth() - 128,
          child: Obx(() => ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.educations.length,
              separatorBuilder: (context, index) {
                return Divider(height: 0.5, thickness: 0.5);
              },
              itemBuilder: (context, index) {
                var education = controller.educations[index];
                return ListTile(
                    isThreeLine: true,
                    title: Text(education.licence ?? ""),
                    contentPadding: EdgeInsets.all(16),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(education.university ?? ""),
                        SizedBox(height: 2),
                        Text("${education.startDate} - ${education.endDate}"),
                        SizedBox(height: 2),
                        Text(education.graduate ?? ""),
                        SizedBox(height: 2),
                        Text(education.location ?? ""),
                      ],
                    ),
                    leading: Icon(FontAwesomeIcons.graduationCap)

                    // leading: Image.asset(
                    //   "assets/logo/${education.logo}.png",
                    //   errorBuilder: (context, error, stackTrace) {
                    //     return Icon(Icons.error); // Placeholder for error
                    //   },
                    // ),
                    );
              })),
        )));
  }
}
