import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class EducationView extends StatelessWidget {
  const EducationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 300),
      child: Center(
        child: Container(
          width: 358,
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Card(
                child: ListTile(
                  isThreeLine: true,
                  title: Row(
                    children: [
                      Text('COMPUTER ENGINEERING'),
                    ],
                  ),
                  contentPadding: EdgeInsets.all(16),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Iskenderun Technical University'),
                      SizedBox(
                        height: 2,
                      ),
                      Text('2018-2022'),
                      SizedBox(
                        height: 2,
                      ),
                      Text('3.2 / 4'),
                    ],
                  ),
                  leading: Image.asset("assets/logo/iste.png"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
