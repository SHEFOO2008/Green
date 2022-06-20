import 'package:flutter/material.dart';

Widget? defaultTextButton ({
  final void Function()? onPressed,
  final bool? enableFeedback,
  required final String text,
  final TextStyle? textStyle,
})
{
  return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        enableFeedback: enableFeedback ?? false,
      ),
      child: Text(
        text,
        style: textStyle,
      ),
  );
}