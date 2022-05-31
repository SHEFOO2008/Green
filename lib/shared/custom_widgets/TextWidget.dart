

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;



  const TextWidget({
    required this.title,
    this.color,
    this.fontWeight,
    this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}