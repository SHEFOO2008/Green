import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  final Key? iconKey;
  final Color? iconColor;
  final String? label;
  final TextDirection? direction;




  const IconWidget({
    required this.icon,
    this.iconSize,
    this.iconKey,
    this.iconColor,
    this.label,
    this.direction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: iconSize,
      key: iconKey,
      color: iconColor,
      semanticLabel: label,
      textDirection: direction,
    );
  }
}