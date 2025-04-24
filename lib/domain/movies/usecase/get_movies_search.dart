import 'package:dartz/dartz.dart';
import 'package:netfilx/common/usecase/usecase.dart';
import 'package:netfilx/domain/movies/repository/movie_repository.dart';
import 'package:netfilx/service_locator.dart';

class GetMoviesSearchUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<MovieRepository>().searchMovies(params!);
  }
}
