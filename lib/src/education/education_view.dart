import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/constants/constant.dart';
import 'package:web_site_ahmetozkanio/src/education/education_view_controller.dart';

class EducationView extends GetView<EducationViewController> {
  const EducationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EducationViewController controller = Get.put(EducationViewController());
    return DelayedDisplay(
      delay: Duration(milliseconds: 300),
      child: Center(
        child: Container(
          width: Constant().getMobileWidth() - 128,
          child: 
          Obx(() =>
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.educations.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  isThreeLine: true,
                  title:
                      Text(controller.educations[index].licence ?? ""),
                  
                  contentPadding: EdgeInsets.all(16),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                          controller.educations[index].university ?? ""),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          "${controller.educations[index].startDate}-${controller.educations[index].endDate}"),
                      SizedBox(
                        height: 2,
                      ),
                      Text(controller.educations[index].graduate ?? ""),
                    ],
                  ),
                  leading: Image.asset(
                          "assets/logo/${controller.educations[index].logo}.png")
                     ,
                ),
              );
            },
          ),),
        ),
      ),
    );
  }
}
