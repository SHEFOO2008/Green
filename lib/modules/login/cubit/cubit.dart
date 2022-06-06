import 'package:bloc/bloc.dart';
import 'package:green/modules/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());


}