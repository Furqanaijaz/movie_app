import 'package:dartz/dartz.dart';
import 'package:netfilx/common/usecase/usecase.dart';
import 'package:netfilx/domain/tv/repository/tv_repository.dart';
import 'package:netfilx/service_locator.dart';

class GetPopularTvUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<TvRepository>().getPopularTv();
  }
}
