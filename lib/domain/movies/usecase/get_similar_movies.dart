import 'package:dartz/dartz.dart';
import 'package:netfilx/common/usecase/usecase.dart';
import 'package:netfilx/domain/movies/repository/movie_repository.dart';
import 'package:netfilx/service_locator.dart';

class GetSimilarMoviesUsecase implements Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<MovieRepository>().getSimilarMovies(params!);
  }
}
