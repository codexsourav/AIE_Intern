import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/Network/config.dart';
import '../Models/signup_model.dart';

class ProfileController extends GetxController {
  RxString role = "".obs;
  RxString name = "".obs;
  RxString region = "".obs;
  Future<void> logIn(String username, String password) async {
    try {
      final requestData = {
        'username': username,
        'password': password,
      };
      final dio = Dio();
      const url = '${Config.hostUrl}/login';
      final response = await dio.post(url,
          data: jsonEncode(requestData),
          options: Options(
            contentType: Headers.jsonContentType,
          ));
      if (response.statusCode == 200) {
        print(SignupModel.fromJson(response.data).message);
        print("============================================");
        Fluttertoast.showToast(
            msg: SignupModel.fromJson(response.data).message!);
      } else {
        Fluttertoast.showToast(
            msg: SignupModel.fromJson(response.data).message!);
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
