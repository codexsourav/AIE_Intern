import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:learnbloc/src/data/Network/BaseApiService.dart';
import 'package:learnbloc/src/data/exceptions/ApiException.dart';

class NetworkApiService extends BaseApiService {
// Reqst Get On server
  @override
  Future sendGetApiRequest(String url) async {
    // ignore: unused_local_variable
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

// Reqst post On server
  @override
  Future sendPostApiRequest(String url, data) async {
    // ignore: unused_local_variable
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

// Manage request response validate and throw [Exception]
  dynamic returnResponse(http.Response response) {
    final statuscode = response.statusCode;
    switch (statuscode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException("Bad Request Exception");
      case 404:
        throw BadRequestException("Requst Uri Not Found!");
      default:
        throw FetchDataException(
            "Error accurd while communication with server : Status Code ${response.statusCode}");
    }
  }
}
