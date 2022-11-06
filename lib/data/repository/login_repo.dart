import 'package:gellary_task/data/model/loign_modle.dart';
import 'package:gellary_task/data/end_points/end_points.dart';
import 'package:gellary_task/data/web_services/remote/dio_helper.dart';
import 'package:gellary_task/exception/exceptions.dart';
import 'package:gellary_task/data/web_services/remote/hive_helper.dart';
import 'package:gellary_task/data/web_services/remote/dio_helper.dart';

abstract class ILoginRepository {
  Future<LoginModel?> loginUser({
    required String email,
    required String password,
  });
    Future<void> logout();
}

class LoginRepository implements ILoginRepository {
  @override
  Future<LoginModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final result = await DioHelper.postData(
      url: login,
      data: {
        'email': email,
        'password': password,
      },
    );
    final resultData = result.data as Map<String, dynamic>;
    if (resultData.containsKey('error_message')) {
      throw InvaildEmailOrPasswordException();
    }
    final loginModel = LoginModel.fromJson(resultData);
      await HiveHelper.storeToken(loginModel.token.toString());
      DioHelper.setToken(loginModel.token.toString());
      return loginModel;
  }
   Future<void> logout() async {
    HiveHelper.logOut();
    DioHelper.deleteToken();
  }
}
