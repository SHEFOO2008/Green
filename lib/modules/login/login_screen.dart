import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/modules/login/cubit/cubit.dart';
import 'package:green/modules/login/cubit/states.dart';
import 'package:green/modules/register/register_screen.dart';
import 'package:green/shared/Functions.dart';
import '../../shared/custom_widgets/TextFormFieldWidget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    FocusNode fieldNode = FocusNode();

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LOGIN',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato-Bold',
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      'Save the world.',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Lato-Regular',
                      ),

                    ),
                    const SizedBox(height: 30),

                    TextFormFieldWidget(
                      focusNode: fieldNode,
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      obsecureText: false,
                      validation: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter an Email';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                          return 'Please enter a valid Email';
                        }
                        return null;
                      },
                      label: 'Email Address',
                      focusBorderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      prefixIcon: const Icon(
                        Icons.email,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      focusBorderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormFieldWidget(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      obsecureText: LoginCubit.get(context).isPassword,
                      validation: (String? value) {
                        if (value!.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      label: 'Password',
                      focusBorderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      suffixIcon: LoginCubit.get(context).suffix,
                      onSuffixPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
                      },
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      focusBorderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ConditionalBuilder(
                        condition: state is !LoginLoadingState,
                        builder: (context) => MaterialButton(
                          onPressed: () {

                            if(_formKey.currentState!.validate())
                              {
                                print('test');
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                          },
                          color: Colors.green,
                          minWidth: double.infinity,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Lato-Bold',
                            ),
                          ),
                        ),
                        fallback: (context) => const Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: RichText(text: TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.grey,
                          fontFamily: 'Lato-Regular',
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.green,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {

                              //TODO: Change to navigateAndReplaceTo to replace the current screen
                              navigateTo(const RegisterScreen(), context);
                            },
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        },
      ),
    );
  }
}
