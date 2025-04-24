import 'package:dartz/dartz.dart';
import 'package:netfilx/common/usecase/usecase.dart';
import 'package:netfilx/domain/movies/repository/movie_repository.dart';
import 'package:netfilx/service_locator.dart';

class GetnowplayingmovieUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getNowPlayingMovies();
  }
}
