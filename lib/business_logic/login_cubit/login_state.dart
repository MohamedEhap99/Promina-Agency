import 'package:gellary_task/data/model/loign_modle.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

///           STATE LOGIN

class LoginLoadingState extends LoginState {}

class LoginSuccessStateState extends LoginState {
  late final LoginModel loginModel;
  LoginSuccessStateState(this.loginModel);
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}






