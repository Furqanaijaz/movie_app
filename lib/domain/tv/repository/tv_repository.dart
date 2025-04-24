import 'package:dartz/dartz.dart';

abstract class TvRepository {
  Future<Either> getPopularTv();
  Future<Either> getTvRecommendation(int tvId);
  Future<Either> getTvTrailer(int tvId);

  Future<Either> getSimilarTv(int tvId);
  Future<Either> getTvKeyword(int tvId);
  Future<Either> searchTvs(String query);
}
