import 'package:http/http.dart' as http;

import 'config.dart';

class ApiNetwork {
  static Future<dynamic> sendGetRequest(endpoient) async {
    try {
      var data = await http.get(Uri.parse('${Config.hostUrl}/$endpoient'));
      return data;
    } catch (e) {
      throw Exception("Sumthing Error Fetch Data: $e");
    }
  }
}
