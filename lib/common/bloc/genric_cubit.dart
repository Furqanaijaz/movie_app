import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/common/bloc/genric_state.dart';
import 'package:netfilx/common/usecase/usecase.dart';

class GenricDataCubit extends Cubit<GenricDataState> {
  GenricDataCubit() : super(DataLoadingState());
  void getData<T>(Usecase usecase, {dynamic params}) async {
    var returnData = await usecase.call(params: params);
    returnData.fold((error) {
      emit(DataErrorState(error: error));
    }, (data) {
      emit(DataLoadedState(data: data));
    });
  }
}
