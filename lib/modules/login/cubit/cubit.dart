import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/modules/login/cubit/states.dart';
import 'package:green/shared/network/remote/dio_helper.dart';
import '../../../models/login_model.dart';
import '../../../shared/network/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
         data:{
           'email' : email,
           'password' : password,
         },
    ).then((value) {
      loginModel = LoginModel.fromJosn(value.data);
      emit(LoginSuccessState(loginModel!));
      });
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordVisibilityState());
  }
}