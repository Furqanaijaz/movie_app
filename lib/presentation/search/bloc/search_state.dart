import 'package:netfilx/domain/movies/entity/movie_enitity.dart';
import 'package:netfilx/domain/tv/entity/tv_entity.dart';

abstract class SearchState {}

class SearchInitState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchMovieLoadedState extends SearchState {
  final List<MovieEnitity> movie;

  SearchMovieLoadedState({required this.movie});
}

class SearchTvLoadedState extends SearchState {
  final List<TvEntity> tvs;

  SearchTvLoadedState({required this.tvs});
}

class SearchErroeState extends SearchState {
  final String error;

  SearchErroeState({required this.error});
}
