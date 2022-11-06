import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary_task/business_logic/login_cubit/login_state.dart';

import 'package:gellary_task/data/repository/login_repo.dart';
import 'package:gellary_task/exception/exceptions.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.iloginRepository) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  /// initialize Repo
  final ILoginRepository iloginRepository;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final result =
          await iloginRepository.loginUser(email: email, password: password);

      emit(LoginSuccessStateState(result!));
    } on InvaildEmailOrPasswordException catch (error) {
      emit(LoginErrorState(error.toString()));
      rethrow;
    } catch (e) {
      print(e);
      emit(LoginErrorState(e.toString()));
      rethrow;
    }
  }
 
   x() => 4;

  Future<void> logout() async {
    return iloginRepository.logout();
  }
}
