import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchType { movie, tv }

class SelectableCubit extends Cubit<SearchType> {
  SelectableCubit() : super(SearchType.movie);
  void selectMovie() => emit(SearchType.movie);
  void selectTv() => emit(SearchType.tv);
}
