// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:netfilx/domain/movies/usecase/get_movies_search.dart';
// import 'package:netfilx/domain/tv/usecase/search_tvs_usecase.dart';
// import 'package:netfilx/presentation/search/bloc/search_state.dart';
// import 'package:netfilx/presentation/search/bloc/selectable_cubit.dart';
// import 'package:netfilx/service_locator.dart';

// class SearchCubit extends Cubit<SearchState> {
//   SearchCubit() : super(SearchInitState());
//   TextEditingController textEditingController = TextEditingController();
//   void search(String query, SearchType searchType) {
//     if (query.isNotEmpty) {
//       emit(SearchLoadingState());

//       switch (searchType) {
//         case SearchType.movie:
//           searchMovie(query);

//           break;
//         case SearchType.tv:
//           searchTvs(query);

//           break;
//       }
//     }
//   }

//   void searchMovie(String query) async {
//     var returnData = await sl<GetMoviesSearchUseCase>().call(params: query);
//     returnData.fold((error) {
//       emit(SearchErroeState(error: error));
//     }, (data) {
//       emit(SearchMovieLoadedState(movie: data));
//     });
//   }

//   void searchTvs(String query) async {
//     var returnData = await sl<SearchTvsUsecase>().call(params: query);
//     returnData.fold((error) {
//       emit(SearchErroeState(error: error));
//     }, (data) {
//       emit(SearchTvLoadedState(tvs: data));
//     });
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/domain/movies/usecase/get_movies_search.dart';
import 'package:netfilx/domain/tv/usecase/search_tvs_usecase.dart';
import 'package:netfilx/presentation/search/bloc/search_state.dart';
import 'package:netfilx/presentation/search/bloc/selectable_cubit.dart';
import 'package:netfilx/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitState());

  TextEditingController textEditingController = TextEditingController();

  void search(String query, SearchType searchType) {
    emit(SearchLoadingState());
    if (query.isNotEmpty) {
      switch (searchType) {
        case SearchType.movie:
          searchMovie(query);
          break;

        case SearchType.tv:
          searchTvs(query);
          break;
      }
    }
  }

  void searchMovie(String query) async {
    var returnData = await sl<GetMoviesSearchUseCase>().call(params: query);
    returnData.fold((error) {
      emit(SearchErroeState(error: error));
    }, (data) {
      emit(SearchMovieLoadedState(movie: data));
    });
  }

  void searchTvs(String query) async {
    var returnData = await sl<SearchTvsUsecase>().call(params: query);
    returnData.fold((error) {
      emit(SearchErroeState(error: error));
    }, (data) {
      emit(SearchTvLoadedState(tvs: data));
    });
  }
}
