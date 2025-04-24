import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/core/config/assets/app_images.dart';
import 'package:netfilx/presentation/auth/login.dart';
import 'package:netfilx/presentation/home/page/home_page.dart';
import 'package:netfilx/presentation/splash/bloc/splash_cubit.dart';
import 'package:netfilx/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) => {
        if (state is Authenticated)
          {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            }))
          },
        if (state is UnAuthenticated)
          {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return Login();
            }))
          }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppImages.splash))),
            ),
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                  const Color(0xff1A1B20).withOpacity(0),
                  const Color(0xff1A1B20)
                ]))),
          ],
        ),
      ),
    );
  }
}
