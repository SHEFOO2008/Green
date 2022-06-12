import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/layout/cubit/states.dart';
import 'package:green/models/home_model.dart';
import 'package:green/modules/categories/categories_screen.dart';
import 'package:green/modules/favourites/favourites_screen.dart';
import 'package:green/modules/products/products_screen.dart';
import 'package:green/shared/network/remote/dio_helper.dart';
import 'dart:developer';
import '../../shared/constants.dart';
import '../../shared/network/end_points.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
  ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  void getHomeData()
  {
    HomeModel? homeModel;
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
        url: HOME,
        token: token,
    ).then((value) async{
      homeModel = HomeModel();
      await homeModel?.getData();

      log(homeModel!.products![1].price.toString());
      print('trying');
      emit(ShopSuccessHomeDataState());
    });
  }
}