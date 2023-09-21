import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Providers/UserProfileProvider.dart';
import '../../../data/Network/config.dart';
import '../../Student/home_screen.dart';
import '../Models/signup_model.dart';

class ProfileController extends GetxController {
  RxString role = "".obs;
  RxString name = "".obs;
  RxString region = "".obs;
  Future<void> logIn(context, String username, String password) async {
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
        print(response.data);
        print(SignupModel.fromJson(response.data).message);
        print(SignupModel.fromJson(response.data).userId);

        bool res =
            await Provider.of<UserProfileProvider>(context, listen: false)
                .setUSerAuthCradencials(
          usernameid: response.data['user_id'],
          useroal: response.data["role"],
          id: "",
        );
        if (res) {
          Fluttertoast.showToast(
              msg: SignupModel.fromJson(response.data).message!);

          Get.offAll(const StudentHomeScreen());
        } else {
          Fluttertoast.showToast(msg: "Something went wrong");
        }
        print("============================================");
      } else {
        Fluttertoast.showToast(
            msg: SignupModel.fromJson(response.data).message!);
        print(response.statusCode);
      }
    } on DioException catch (e) {
      if (e.response!.data != null) {
        Fluttertoast.showToast(
            msg: SignupModel.fromJson(e.response!.data).message ??
                "Something went wrong");
      }
    }
  }
}
