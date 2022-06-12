import 'package:flutter/material.dart';
import 'package:green/modules/login/login_screen.dart';

import 'network/local/cache_helper.dart';

void navigateTo(page, context)
{
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

void navigateAndReplaceTo(page, context)
{
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => page));
}

void submit(context)
{
  CacheHelper.saveData(key: 'onBoarding', value: true,).then((value) {
    if(value)
      {
        navigateAndReplaceTo(LoginScreen(), context);
      }
  });
}

 void signOut(context)
 {
   CacheHelper.removeData(key: 'token').then((value){
   navigateAndReplaceTo(LoginScreen(), context);
   });
 }

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
