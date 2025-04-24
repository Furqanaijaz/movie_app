import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/common/bloc/button_state.dart';
import 'package:netfilx/common/usecase/usecase.dart';

class AuthButtonCubit extends Cubit<AuthButtonState> {
  AuthButtonCubit() : super(ButtonInitState());

  void execute({dynamic params, required Usecase usecase}) async {
    emit(ButtonLoadingStates());
    try {
      Either result = await usecase.call(params: params);
      result.fold((error) {
        emit(ButtonErrorState(error: error));
      }, (data) {
        emit(ButtonLoadedState());
      });
    } catch (e) {
      emit(ButtonErrorState(error: e.toString()));
    }
  }
}
