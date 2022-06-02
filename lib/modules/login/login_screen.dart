import 'package:flutter/material.dart';

import '../../shared/custom_widgets/TextFormFieldWidget.dart';

class LoginScreen extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'LOGIN',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                  'login now to save the world',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.grey,
                ),

              ),
              const SizedBox(height: 30),
              TextFormFieldWidget(
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
                  Radius.circular(10),
                ),
                prefixIcon: const Icon(
                  Icons.email,
                ),
                borderSide: const BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
                focusBorderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              const SizedBox(height: 16),
              TextFormFieldWidget(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                obsecureText: true,
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
                  Radius.circular(10),
                ),
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                suffixIcon: Icons.remove_red_eye,
                onSuffixPressed: () {

                },
                borderSide: const BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
                focusBorderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              TextButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      print('valid');
                    }
                  },
                  child: Text('test'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
