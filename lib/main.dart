import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/core/config/theme/app_theme.dart';
import 'package:netfilx/presentation/splash/bloc/splash_cubit.dart';
import 'package:netfilx/presentation/splash/page/splash.dart';
import 'package:netfilx/service_locator.dart';

void main() async {
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BlocProvider(
        create: (context) => SplashCubit()..appStarted(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.appTheme,
          home: const SplashPage(),
        ));
  }
}
