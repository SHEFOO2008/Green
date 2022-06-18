import 'package:flutter/material.dart';
import 'package:green/layout/shop_layout.dart';
import 'package:green/models/home_model.dart';
import 'package:green/modules/login/login_screen.dart';
import 'package:green/shared/constants.dart';
import 'package:green/shared/network/local/cache_helper.dart';
import 'package:green/shared/network/remote/dio_helper.dart';
import 'package:green/shared/styles/themes.dart';
import 'modules/onBoarding/on_boarding_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  var onBoarding = await CacheHelper.getData(key: 'onBoarding') ?? false;
  var isDark = CacheHelper.getData(key: 'isDark') ?? false;
  token = await CacheHelper.getData(key: 'token') ?? '';
  if(onBoarding != null)
    {
      if(token != '') widget = const ShopLayout();
      else widget = LoginScreen();
    } else widget = OnBoardingScreen();

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget
{
  final bool isDark;
  final Widget startWidget;

  MyApp({
    required this.isDark,
    required this.startWidget,
});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: startWidget,
    );
  }
}
