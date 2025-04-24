abstract class GenricDataState {}

class DataLoadingState extends GenricDataState {}

class DataLoadedState<T> extends GenricDataState {
  final T data;

  DataLoadedState({required this.data});
}

class DataErrorState extends GenricDataState {
  final String error;

  DataErrorState({required this.error});
}
