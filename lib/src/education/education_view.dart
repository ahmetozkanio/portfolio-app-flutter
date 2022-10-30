import 'package:flutter/material.dart';

class EducationView extends StatelessWidget {
  const EducationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        child: ListView.builder(
          itemCount: 15,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                isThreeLine: true,
                title: Row(
                  children: [
                    SelectableText('COMPUTER ENGINEERING'),
                  ],
                ),
                contentPadding: EdgeInsets.all(16),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText('ISKENDERUN TEKNIK UNIVERSITESI'),
                    SizedBox(
                      height: 2,
                    ),
                    SelectableText('2018-2022'),
                    SizedBox(
                      height: 2,
                    ),
                    SelectableText('3.2 / 4'),
                  ],
                ),
                trailing:
                    Image.network('http://iste.edu.tr/files/iste_arma.png'),
              ),
            );
          },
        ),
      ),
    );
  }
}
