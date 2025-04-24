import 'package:dartz/dartz.dart';
import 'package:netfilx/common/usecase/usecase.dart';
import 'package:netfilx/data/auth/model/signup_model.dart';
import 'package:netfilx/domain/auth/repository/repository.dart';
import 'package:netfilx/service_locator.dart';

class SignupUsecase implements Usecase<Either, SignupModel> {
  @override
  Future<Either> call({SignupModel? params}) async {
    return await sl<Repository>().signup(params!);
  }
}
