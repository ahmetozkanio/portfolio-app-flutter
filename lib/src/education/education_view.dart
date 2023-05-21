import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_site_ahmetozkanio/src/education/education_view_controller.dart';

class EducationView extends GetView<EducationViewController> {
  const EducationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 300),
      child: Center(
        child: Container(
          width: 358,
          child: ListView.builder(

            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
 [
              Card(
                child: ListTile(
                  isThreeLine: true,
                  title: Row(
                    children: [
                      Text(controller.educations[index].licence ?? ""),
                    ],
                  ),
                  contentPadding: EdgeInsets.all(16),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                            controller.educations[index].university ?? ""),
                      SizedBox(
                        height: 2,
                      ),
                      Text("${controller.educations[index].startDate}-${controller.educations[index].endDate}"),
                      SizedBox(
                        height: 2,
                      ),
                      Text(controller.educations[index].graduate ?? ""),
                    ],
                  ),
                  leading:controller.educations[index].image != null ? Image.asset(controller.educations[index].image.toString()) : SizedBox(),
                ),
              )
            ];
            },
       
          ),
        ),
      ),
    );
  }
}
