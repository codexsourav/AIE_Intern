import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:schoolpenintern/data/Constents.dart';
import 'package:schoolpenintern/data/Network/BaseApiService.dart';
import 'package:schoolpenintern/data/exceptions/ApiException.dart';
import 'package:schoolpenintern/data/models/UploadFileFormModel.dart';

import '../../utiles/randamString.dart';

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

// upload Media
  Future<void> uploadImageWithData(UploadFile data) async {
    dynamic responseJson;
    // Replace with your API endpoint
    final url = Uri.parse(data.apiuri);

    String fileExtension = extension(data.filepath);

    if (!allowExtension.contains(fileExtension)) {
      throw BadRequestException("Invalid File Type");
      // return false;
    }

    // Create a multipart request
    File file = File(data.filepath);
    final request = http.MultipartRequest('POST', url);
    final imageStream = http.ByteStream(file.openRead());
    final imageLength = await file.length();

    final multipartFile = http.MultipartFile(
      data.serverPath,
      imageStream,
      imageLength,
      filename: generateRandomString(15),
    );

    request.files.add(multipartFile);
    // Add dynamic form fields
    data.formData?.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    http.StreamedResponse response = await request.send();
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
