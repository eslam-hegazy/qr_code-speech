import "package:flutter/material.dart";

import 'package:responsive_sizer/responsive_sizer.dart';

import 'screens/qr_code.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          title: "Log App",
          debugShowCheckedModeBanner: false,
          home: QRScreen(),
        );
      },
    );
  }
}
