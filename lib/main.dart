import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/layout/shop_layout.dart';
import 'package:green/modules/login/login_screen.dart';
import 'package:green/shared/constants.dart';
import 'package:green/shared/network/local/cache_helper.dart';
import 'package:green/shared/network/remote/dio_helper.dart';
import 'package:green/shared/styles/themes.dart';
import 'modules/onBoarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  BlocObserver();
  await CacheHelper.init();
  Widget widget;
  var onBoarding = await CacheHelper.getData(key: 'onBoarding') ?? false;
  var isDark = CacheHelper.getData(key: 'isDark') ?? false;
  token = await CacheHelper.getData(key: 'token') ?? '';
  if (onBoarding != null) {
    if (token != '') {
      widget = const ShopLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  const MyApp({
    Key? key,
    required this.isDark,
    required this.startWidget,
  }) : super(key: key);

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
