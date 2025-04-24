import 'package:dartz/dartz.dart';
import 'package:netfilx/common/usecase/usecase.dart';
import 'package:netfilx/domain/tv/repository/tv_repository.dart';
import 'package:netfilx/service_locator.dart';

class SearchTvsUsecase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<TvRepository>().searchTvs(params!);
  }
}
