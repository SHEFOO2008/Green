import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/layout/cubit/states.dart';
import 'package:green/models/categories_model.dart';
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

  HomeModel? homeModel;

  String? lang;


  void getHomeData()
  {

    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
        url: HOME,
        token: token,
    ).then((value) async{
      homeModel = HomeModel();
      await homeModel?.getData();
      emit(ShopSuccessHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories()
  {

    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) async{
      categoriesModel = CategoriesModel();
      await categoriesModel?.getData();
      emit(ShopSuccessCategoriesState());
    });
  }
}