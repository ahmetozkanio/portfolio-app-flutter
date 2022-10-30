import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CvView extends StatelessWidget {
  const CvView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfPdfViewer.asset('assets/images/ahmet_ozkan_cv.pdf'));
  }
}
