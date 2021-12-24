// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class responsiveApp extends StatelessWidget {
  final Widget mobile;
  final Widget tab;
  final Widget desktop;

  const responsiveApp(
      {Key? key,
      required this.mobile,
      required this.tab,
      required this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return mobile;
        } else if (constraints.maxHeight > 768 || constraints.maxWidth < 1000) {
          return tab;
        } else {
          return desktop;
        }
      },
    );
  }
}
