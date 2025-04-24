import 'package:get_it/get_it.dart';
import 'package:netfilx/core/network/dio_clint.dart';
import 'package:netfilx/data/auth/repository/repository_impl.dart';
import 'package:netfilx/data/auth/source/auth_api_service.dart';
import 'package:netfilx/data/movies/repository/movie_reposity_impl.dart';
import 'package:netfilx/data/movies/source/movie_Api_service.dart';
import 'package:netfilx/data/tv/repository/tv_repo_impl.dart';
import 'package:netfilx/data/tv/source/tv_api_service.dart';
import 'package:netfilx/domain/auth/repository/repository.dart';
import 'package:netfilx/domain/auth/usecase/is_logged_in.dart';
import 'package:netfilx/domain/auth/usecase/signin_usecase.dart';
import 'package:netfilx/domain/auth/usecase/signup_usecase.dart';
import 'package:netfilx/domain/movies/repository/movie_repository.dart';
import 'package:netfilx/domain/movies/usecase/getNowPlayingMovie.dart';
import 'package:netfilx/domain/movies/usecase/get_movies_search.dart';
import 'package:netfilx/domain/movies/usecase/get_recommendation_usecase.dart';
import 'package:netfilx/domain/movies/usecase/get_similar_movies.dart';
import 'package:netfilx/domain/movies/usecase/get_trailer.dart';
import 'package:netfilx/domain/movies/usecase/get_trending_movies.dart';
import 'package:netfilx/domain/tv/repository/tv_repository.dart';
import 'package:netfilx/domain/tv/usecase/getTvKeywords.dart';
import 'package:netfilx/domain/tv/usecase/get_popular_tv.dart';
import 'package:netfilx/domain/tv/usecase/get_recommendation_tv.dart';
import 'package:netfilx/domain/tv/usecase/get_similar_tv.dart';
import 'package:netfilx/domain/tv/usecase/get_tv_trailer.dart';
import 'package:netfilx/domain/tv/usecase/search_tvs_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<DioClient>(DioClient());

  //service
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieApiService>(MovieApiServiceImpl());
  sl.registerSingleton<TvApiService>(TvApiServiceImpl());

  //repositories
  sl.registerSingleton<Repository>(RepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieReposityImpl());
  sl.registerSingleton<TvRepository>(TvRepositoryImpl());

  //Usecase
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<GetTrendingMoviesUsecase>(GetTrendingMoviesUsecase());
  sl.registerSingleton<GetnowplayingmovieUseCase>(GetnowplayingmovieUseCase());
  sl.registerSingleton<GetPopularTvUsecase>(GetPopularTvUsecase());
  sl.registerSingleton<GetTrailerUseCase>(GetTrailerUseCase());
  sl.registerSingleton<GetRecommendationMoviesUseCase>(
      GetRecommendationMoviesUseCase());
  sl.registerSingleton<GetSimilarMoviesUsecase>(GetSimilarMoviesUsecase());
  sl.registerSingleton<GetSimilarTvUseCase>(GetSimilarTvUseCase());

  sl.registerSingleton<GetRecommendationTvUseCase>(
      GetRecommendationTvUseCase());
  sl.registerSingleton<GettvkeywordsUseCase>(GettvkeywordsUseCase());
  sl.registerSingleton<GetTvTrailerUsecase>(GetTvTrailerUsecase());
  sl.registerSingleton<GetMoviesSearchUseCase>(GetMoviesSearchUseCase());
  sl.registerSingleton<SearchTvsUsecase>(SearchTvsUsecase());
}
