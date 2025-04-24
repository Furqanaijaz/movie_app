import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netfilx/common/navigation/app_navigation.dart';
import 'package:netfilx/core/config/theme/app_colors.dart';
import 'package:netfilx/data/auth/model/signin_model.dart';
import 'package:netfilx/domain/auth/usecase/signin_usecase.dart';
import 'package:netfilx/presentation/auth/singup.dart';
import 'package:netfilx/presentation/home/page/home_page.dart';
import 'package:netfilx/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.only(top: 100, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _singinText(),
              const SizedBox(
                height: 50,
              ),
              _emailField(),
              const SizedBox(
                height: 20,
              ),
              _passwordField(),
              const SizedBox(
                height: 20,
              ),
              _singinButton(context),
              const SizedBox(
                height: 50,
              ),
              _sigupText(context)
            ],
          )),
    );
  }

  Widget _singinText() {
    return const Text(
      'Sing in',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: email,
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: password,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _singinButton(BuildContext context) {
    return ReactiveButton(
      title: "Signin",
      activeColor: AppColors.primary,
      onSuccess: () {
        AppNavigator.push(context, const HomePage());
      },
      onPressed: () async {
        await sl<SigninUsecase>().call(
            params: SigninModel(email: email.text, password: password.text));
        AppNavigator.push(context, const HomePage());
      },
      onFailure: (error) => Container(),
    );
  }

  Widget _sigupText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Do you Have account? "),
      TextSpan(
          text: "Signup",
          style: const TextStyle(
            color: Colors.blue,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, Singup());
            })
    ]));
  }
}
