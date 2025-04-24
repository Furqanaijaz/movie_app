import 'package:dartz/dartz.dart';
import 'package:netfilx/common/usecase/usecase.dart';
import 'package:netfilx/data/auth/model/signin_model.dart';
import 'package:netfilx/domain/auth/repository/repository.dart';
import 'package:netfilx/service_locator.dart';

class SigninUsecase implements Usecase<Either, SigninModel> {
  @override
  Future<Either> call({SigninModel? params}) async {
    return await sl<Repository>().signin(params!);
  }
}
