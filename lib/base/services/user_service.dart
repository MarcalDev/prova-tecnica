import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seventh_prova_tecnica/base/services/base_service.dart';
import 'package:seventh_prova_tecnica/base/services/interfaces/iuser_service.dart';

class UserService extends BaseService implements IUserService {
  @override
  Future<String> login(String username, String password) async {
    var url = Uri.parse('${urlBase}login');
    var response = await http
        .post(url, body: {'username': username, 'password': password});
    if (response.statusCode != 200) throw Exception();
    var decodedBody = json.decode(response.body);
    return decodedBody['token'];
  }
}
