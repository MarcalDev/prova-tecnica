import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  Future<String> login(String username, String password) async {
    var url = Uri.parse('https://mobiletest.seventh.com.br/login');
    var response = await http
        .post(url, body: {'username': username, 'password': password});
    if (response.statusCode != 200) throw Exception();
    var decodedBody = json.decode(response.body);
    return decodedBody['token'];
  }
}
