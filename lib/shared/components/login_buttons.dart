import 'package:flutter/material.dart';

Widget button (Color clr, Text txt, Image img,)
{
  return SizedBox(
    height: 50.0,
    child: ElevatedButton.icon(
      onPressed: () {

      },
      icon: img,

      label: txt,
      style: ElevatedButton.styleFrom(

          primary: clr,
          textStyle: const TextStyle(fontSize: 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0)
          )
      ),

    ),
  );
}