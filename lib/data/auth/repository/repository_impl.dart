import 'package:dartz/dartz.dart';
import 'package:netfilx/data/auth/model/signin_model.dart';
import 'package:netfilx/data/auth/source/auth_api_service.dart';
import 'package:netfilx/domain/auth/repository/repository.dart';
import 'package:netfilx/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/signup_model.dart';

class RepositoryImpl extends Repository {
  @override
  Future<Either> signup(SignupModel params) async {
    var data = await sl<AuthApiService>().signup(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
  }

  @override
  Future<Either> signin(SigninModel signinModel) async {
    var data = await sl<AuthApiService>().signin(signinModel);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
