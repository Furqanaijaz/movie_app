import 'package:netfilx/domain/movies/entity/movie_enitity.dart';

abstract class TrendingState {}

class TrendingLoadingState extends TrendingState {}

class TrendingLoadedState extends TrendingState {
  final List<MovieEnitity> movie;

  TrendingLoadedState({required this.movie});
}

class TrendingErrorState extends TrendingState {
  final String error;

  TrendingErrorState({required this.error});
}
