import 'package:ahmetozkanio/src/features/experience/experience_view_controller.dart';
import 'package:ahmetozkanio/src/utils/constants/constant.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

final class ExperienceView extends GetView<ExperienceViewController> {
  ExperienceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 200),
      child: Center(
        child: Container(
          width: Constant.getMobileWidth() - 128,
          child: Obx(
            () => ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.experiences.length,
              separatorBuilder: (context, index) {
                return Divider(height: 0.5, thickness: 0.5);
              },
              itemBuilder: (context, index) {
                var experience = controller.experiences[index];
                return ListTile(
                    isThreeLine: true,
                    title: SelectableText(experience.title ?? ""),
                    contentPadding: EdgeInsets.all(16),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(experience.company ?? ""),
                        SizedBox(height: 2),
                        Text(
                          "${experience.startDate} - ${experience.endDate} • ${experience.employmentType}",
                        ),
                        SizedBox(height: 2),
                        Text(
                            "${experience.location} - ${experience.locationType}"),
                      ],
                    ),
                    leading: Icon(FontAwesomeIcons.apple)
                    // Image.asset(
                    //   "assets/logo/${experience.logo}.png",
                    //   errorBuilder: (context, error, stackTrace) {
                    //     return Icon(Icons.error); // Placeholder for error
                    //   },
                    // ),

                    );
              },
            ),
          ),
        ),
      ),
    );
  }
}
