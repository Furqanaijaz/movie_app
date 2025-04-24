abstract class AuthButtonState {}

class ButtonInitState extends AuthButtonState {}

class ButtonLoadingStates extends AuthButtonState {}

class ButtonLoadedState extends AuthButtonState {}

class ButtonErrorState extends AuthButtonState {
  final String error;

  ButtonErrorState({required this.error});
}
