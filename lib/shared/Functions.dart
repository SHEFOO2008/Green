import 'package:flutter/material.dart';

import 'network/local/cache_helper.dart';

void navigateTo(page, context)
{
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

void navigateAndReplaceTo(page, context)
{
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => page));
}

void signOut(context)
{
  CacheHelper.clearData(key: 'token')?.then((value){
    //navigateTo(LoginScreen(), context);
  });
}

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
