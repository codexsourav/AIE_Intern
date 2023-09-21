import 'dart:convert';

import 'package:http/http.dart' as http;

import 'config.dart';

class ApiNetwork {
  static Future<dynamic> sendGetRequest(endpoient) async {
    try {
      var data = await http.get(Uri.parse('${Config.hostUrl}/$endpoient'));
      print(data);
      return jsonDecode(data.body);
    } catch (e) {
      throw Exception("Sumthing Error Fetch Data: $e");
    }
  }
}
