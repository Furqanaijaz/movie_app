import 'package:dartz/dartz.dart';
import 'package:netfilx/common/usecase/usecase.dart';
import 'package:netfilx/domain/tv/repository/tv_repository.dart';
import 'package:netfilx/service_locator.dart';

class GettvkeywordsUseCase implements Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<TvRepository>().getTvKeyword(params!);
  }
}
