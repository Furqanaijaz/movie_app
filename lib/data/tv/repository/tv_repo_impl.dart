import 'package:dartz/dartz.dart';
import 'package:netfilx/core/helper/mapper/keyword.dart';
import 'package:netfilx/core/helper/mapper/trailer_mapper.dart';
import 'package:netfilx/core/helper/mapper/tv_mapper.dart';
import 'package:netfilx/core/model/keyword.dart';
import 'package:netfilx/core/model/trailer.dart';
import 'package:netfilx/data/tv/model/tv.dart';
import 'package:netfilx/data/tv/source/tv_api_service.dart';
import 'package:netfilx/domain/tv/repository/tv_repository.dart';
import 'package:netfilx/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getPopularTv() async {
    var returndata = await sl<TvApiService>().getPopularTv();
    return returndata.fold((error) {
      return Left(error);
    }, (data) {
      var tv = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(tv);
    });
  }

  @override
  Future<Either> getSimilarTv(int tvId) async {
    var returnData = await sl<TvApiService>().getSimilarTv(tvId);
    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      var tvSimil = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(tvSimil);
    });
  }

  @override
  Future<Either> getTvRecommendation(int tvId) async {
    var returnData = await sl<TvApiService>().getTvRecommendation(tvId);
    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      var tvRecom = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(tvRecom);
    });
  }

  @override
  Future<Either> getTvKeyword(int tvId) async {
    var returnData = await sl<TvApiService>().getTvKeyword(tvId);
    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      var tvkey = List.from(data['content'])
          .map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)))
          .toList();
      return Right(tvkey);
    });
  }

  @override
  Future<Either> getTvTrailer(int tvId) async {
    var returnedData = await sl<TvApiService>().getTvTrailer(tvId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      if (data == null || data['trailer'] == null) {
        return Left('No trailer data available'); // or handle it appropriately
      }

      var movies =
          TrailerMapper.toEntity(TrailerModel.fromJson(data['trailer']));
      return Right(movies);
    });
  }

  @override
  Future<Either> searchTvs(String query) async {
    var returnData = await sl<TvApiService>().searchTvs(query);
    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      var tvs = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(tvs);
    });
  }

  // @override
  // Future<Either> searchTvs(String query) async {
  //   var returnData = await sl<TvApiService>().searchTvs(query);
  //   return returnData.fold((error) {
  //     return Left(error);
  //   }, (data) {
  //     var tvs = List.from(data['content'])
  //         .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
  //         .toList();
  //     return Right(tvs);
  //   });
  // }
}
