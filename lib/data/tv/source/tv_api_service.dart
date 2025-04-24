import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netfilx/core/constant/appUrl.dart';
import 'package:netfilx/core/network/dio_clint.dart';
import 'package:netfilx/service_locator.dart';

abstract class TvApiService {
  Future<Either> getPopularTv();
  Future<Either> getTvTrailer(int tvId);

  Future<Either> getTvRecommendation(int tvId);
  Future<Either> getSimilarTv(int tvId);
  Future<Either> getTvKeyword(int tvId);
  Future<Either> searchTvs(String query);
}

class TvApiServiceImpl extends TvApiService {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(Appurl.popularTV);
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarTv(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${Appurl.tv}$tvId/similar');
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> getTvRecommendation(int tvId) async {
    try {
      var response =
          await sl<DioClient>().get('${Appurl.tv}$tvId/recommendations');
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> getTvKeyword(int tvId) async {
    try {
      var response = await sl<DioClient>().get('${Appurl.tv}$tvId/keywords');
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> getTvTrailer(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${Appurl.movie}$tvId/trailer',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }

  @override
  Future<Either> searchTvs(String query) async {
    try {
      var response = await sl<DioClient>().get('${Appurl.search}/tv/$query');
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

//   @override
//   Future<Either> searchTvs(String query) async {
//     try {
//       var response = await sl<DioClient>().get('${Appurl.search}/tv/$query');
//       return Right(response.data);
//     } on DioException catch (error) {
//       return Left(error.response!.data['message'].toString());
//     }
//   }
}
