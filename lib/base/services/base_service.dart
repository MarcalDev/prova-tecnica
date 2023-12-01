import 'package:seventh_prova_tecnica/base/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseService {
  final String urlBase = "http://mobiletest.seventh.com.br/";
  SharedPreferences? sharedPreferences;

  Future<String?> getToken() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      var username = sharedPreferences?.getString('username');
      var password = sharedPreferences?.getString('password');

      var newToken = await UserService().login(username!, password!);
      sharedPreferences?.setString('token', newToken!);
      return newToken;
    } catch (e) {
      return null;
    }
  }
}
