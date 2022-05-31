import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  final Key? boxKey;
  final double? height;
  final double? width;
  final Widget? child;



  const SpacerWidget({
    this.boxKey,
    this.height,
    this.width,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: boxKey,
      height: height,
      width: width,
      child: child,
    );
  }
}