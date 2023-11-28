import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  Future<String> login(String username, String password) async {
    // String urlBase =
    //     'https://mobiletest.seventh.com.br/api-docs/#/Authorization/post_login';
    var url = Uri.https(
        'mobiletest.seventh.com.br/api-docs/#/Authorization/post_login');
    var response = await http
        .post(url, body: {'username': username, 'password': password});
    var decodedBody = json.decode(response.body);

    return decodedBody['Token'];
  }
}
