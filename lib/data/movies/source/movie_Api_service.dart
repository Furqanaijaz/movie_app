import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netfilx/core/constant/appUrl.dart';
import 'package:netfilx/core/network/dio_clint.dart';
import 'package:netfilx/service_locator.dart';

abstract class MovieApiService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMoviesTrailer(int movieId);
  Future<Either> getMoviesRecommendation(int movieId);
  Future<Either> getSimilarMovies(int movieId);
  Future<Either> searchMovies(String query);
}

class MovieApiServiceImpl extends MovieApiService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(Appurl.trendingMovies);

      return Right(response.data);
    } on DioException catch (e) {
      print("Error: ${e.response?.statusCode} - ${e.response?.data}");
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(Appurl.nowPlayingMovies);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getMoviesTrailer(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
        '${Appurl.movie}$movieId/trailer',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }

  @override
  Future<Either> getMoviesRecommendation(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
        '${Appurl.movie}$movieId/recommendations',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    try {
      var response =
          await sl<DioClient>().get('${Appurl.movie}$movieId/similar');
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> searchMovies(String query) async {
    try {
      var response = await sl<DioClient>().get('${Appurl.search}/movie/$query');
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  // @override
  // Future<Either> searchMovies(String query) async {
  //   try {
  //     var response = await sl<DioClient>().get('${Appurl.search}/movie/$query');
  //     return Right(response.data);
  //   } on DioException catch (error) {
  //     return Left(error.response!.data['message']);
  //   }
  // }
}
