import 'package:flutter/material.dart';

class CustomView extends StatelessWidget {
  const CustomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
