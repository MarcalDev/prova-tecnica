import 'dart:convert';

import 'package:http/http.dart' as http;

class VideoService {
  Future<String> getVideo(String token, String fileName) async {
    var url = Uri.parse('https://mobiletest.seventh.com.br/video/$fileName');
    var response = await http.get(url, headers: {'X-Access-Token': token});
    if (response.statusCode != 200) throw Exception();
    var decodedBody = json.decode(response.body);
    return decodedBody['url'];
  }
}
