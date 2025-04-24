import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netfilx/common/navigation/app_navigation.dart';
import 'package:netfilx/core/config/theme/app_colors.dart';
import 'package:netfilx/data/auth/model/signup_model.dart';
import 'package:netfilx/domain/auth/usecase/signup_usecase.dart';
import 'package:netfilx/presentation/auth/login.dart';
import 'package:netfilx/presentation/home/page/home_page.dart';
import 'package:netfilx/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class Singup extends StatelessWidget {
  Singup({super.key});
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.only(top: 100, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _singupText(),
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
              _signupButton(context),
              // BlocBuilder<AuthButtonCubit, AuthButtonState>(
              //   builder: (context, state) {
              //     if (state is ButtonLoadingState) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //     return _singupButton(context);
              //   },
              // ),
              const SizedBox(
                height: 50,
              ),
              _siginText(context)
            ],
          )),
    );
  }

  Widget _singupText() {
    return const Text(
      'Sing Up',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: emailField,
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: passwordField,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
        title: 'Sign Up',
        activeColor: AppColors.primary,
        onPressed: () async => sl<SignupUsecase>().call(
              params: SignupModel(
                  email: emailField.text, password: passwordField.text),
            ),
        onSuccess: () {
          AppNavigator.pushAndRemove(context, const HomePage());
        },
        onFailure: (error) {
          print(error);
        });
  }

  Widget _siginText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Do you Have account? "),
      TextSpan(
          text: "Login",
          style: const TextStyle(
            color: Colors.blue,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, Login());
            })
    ]));
  }
}
