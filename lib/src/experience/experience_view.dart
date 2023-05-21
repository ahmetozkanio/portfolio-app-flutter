import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/experience/experience_view_controller.dart';

import '../constants/constant.dart';

class ExperienceView extends GetView<ExperienceViewController> {
  const ExperienceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExperienceViewController controller = Get.put(ExperienceViewController());
    return DelayedDisplay(
      delay: Duration(milliseconds: 300),
      child: Center(
        child: Container(
          width:  Constant().getMobileWidth() - 64.0,
          child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.experiences.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    isThreeLine: true,
                    title:
                        SelectableText(controller.experiences[index].title ?? ""),
                    
                    contentPadding: EdgeInsets.all(16),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                            controller.experiences[index].company ?? ""),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                            "${controller.experiences[index].startDate} - ${controller.experiences[index].endDate} •  ${controller.experiences[index].employmentType}"),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                            "${controller.experiences[index].location} - ${controller.experiences[index].locationType}"),
                      ],
                    ),
                    leading: Image.asset(
                        "assets/logo/${controller.experiences[index].logo}.png"),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
