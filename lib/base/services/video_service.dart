import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seventh_prova_tecnica/base/services/base_service.dart';
import 'package:seventh_prova_tecnica/base/services/interfaces/ivideo_service.dart';

class VideoService extends BaseService implements IVideoService {
  @override
  Future<String?> getVideo(String fileName) async {
    try {
      var url = Uri.parse('${urlBase}video/$fileName');
      var token = await getToken();
      var response = await http.get(url, headers: {'X-Access-Token': token!});
      if (response.statusCode != 200) throw Exception();
      var decodedBody = json.decode(response.body);
      return decodedBody['url'];
    } catch (e) {
      return null;
    }
  }
}
