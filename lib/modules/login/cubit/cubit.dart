import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/modules/login/cubit/states.dart';
import 'package:green/shared/network/remote/dio_helper.dart';
import '../../../shared/network/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    print('test2');
    print(email);
    DioHelper.postData(
        url: LOGIN,
         data:{
           'email' : email,
           'password' : password,
         },
    ).then((value) {
      print(value.data);
      emit(LoginSuccessState());
      }).catchError((error){
       emit(LoginErrorState(error.toString()));
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