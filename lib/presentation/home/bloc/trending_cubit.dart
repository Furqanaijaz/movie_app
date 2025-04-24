import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/domain/movies/usecase/get_trending_movies.dart';
import 'package:netfilx/presentation/home/bloc/trending_state.dart';
import 'package:netfilx/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingLoadingState());
  void getTrending() async {
    var returndata = await sl<GetTrendingMoviesUsecase>().call();
    returndata.fold((error) {
      emit(TrendingErrorState(error: error));
    }, (data) {
      emit(TrendingLoadedState(movie: data));
    });
  }
}
