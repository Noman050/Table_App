// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextStyleWidget extends StatelessWidget {
  late String text;
  late Color colour;
  late double fontSize;
  late FontWeight fontWeight;

  TextStyleWidget(this.text, this.colour, this.fontSize, this.fontWeight, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colour,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
