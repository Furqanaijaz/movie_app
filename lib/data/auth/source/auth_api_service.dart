import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netfilx/core/constant/appUrl.dart';
import 'package:netfilx/core/network/dio_clint.dart';
import 'package:netfilx/data/auth/model/signin_model.dart';
import 'package:netfilx/data/auth/model/signup_model.dart';
import 'package:netfilx/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupModel signupModel);
  Future<Either> signin(SigninModel signinModel);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signup(SignupModel signupModel) async {
    try {
      var response =
          await sl<DioClient>().post(Appurl.signup, data: signupModel.toJson());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signin(SigninModel signinModel) async {
    try {
      var response =
          await sl<DioClient>().post(Appurl.signin, data: signinModel.toJson());

      return Right(response.data);
    } on DioException catch (e) {
      print("fail" + e.response!.data['message']);
      return Left(e.response!.data['message']);
    }
  }
}
