import 'package:flutter/material.dart';

TextFormField field(InputDecoration dc, {String? Function(String? value)? vl})
{
  return TextFormField(
    decoration: dc,
    validator: vl

  );
}