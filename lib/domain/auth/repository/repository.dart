import 'package:dartz/dartz.dart';
import 'package:netfilx/data/auth/model/signin_model.dart';
import 'package:netfilx/data/auth/model/signup_model.dart';

abstract class Repository {
  Future<Either> signup(SignupModel signupModel);
  Future<Either> signin(SigninModel signinModel);
  Future<bool> isLoggedIn();
}
