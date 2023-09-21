import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:schoolpenintern/data/Network/config.dart';

import '../Helper/snackBarHelper.dart';

class AddUsersProvider extends ChangeNotifier {
  final apiUrl = Config.hostUrl;
  final dio = Dio();
  // loader
  bool loading = false;
  // First Screens;
  File? profileImage;
  String? fullname;
  String? gender;
  String? dobdate;
  String? phone;
  String? email;
  String? address;

  // Secend Screen
  String? schoolKey;
  String? userClass;
  String? status;
  String? statusdesc;

  String? about;
  // fot teacher
  String? teachingsubjects;

  // Therd Screen
  String? userid;
  String? pass;
  String? cpass;

  // Set This Data
  setData({
    File? gteprofileImage,
    String? gtefullname,
    String? gtegender,
    String? gtedobdate,
    String? gtephone,
    String? gteemail,
    String? getaddress,
    /////////////////////////////
    String? getschoolKey,
    String? getuserClass,
    String? getstatus,
    String? getstatusdesc,
    String? getabout,
    String? geteachingsubjects,
    //////////////////////////
    String? getuserid,
    String? getpassword,
    String? repassword,
  }) {
    profileImage = gteprofileImage ?? profileImage;
    fullname = gtefullname ?? fullname;
    gender = gtegender ?? gender;
    dobdate = gtedobdate ?? dobdate;
    phone = gtephone ?? phone;
    email = gteemail ?? email;
    address = getaddress ?? address;
    ///////////////////////////////////
    schoolKey = getschoolKey ?? schoolKey;
    userClass = getuserClass ?? userClass;
    status = getstatus ?? status;
    statusdesc = getstatusdesc ?? statusdesc;

    about = getabout ?? about;
    teachingsubjects = geteachingsubjects ?? teachingsubjects;
    ////////////////////////////
    userid = getuserid ?? userid;
    pass = getpassword ?? pass;
    cpass = repassword ?? cpass;

    notifyListeners();
  }

  void resetFormState() {
    profileImage = null;
    fullname = null;
    gender = null;
    dobdate = null;
    phone = null;
    email = null;
    address = null;
    schoolKey = null;
    userClass = null;
    status = null;
    statusdesc = null;
    about = null;
    teachingsubjects = null;
    userid = null;
    pass = null;
    cpass = null;
    notifyListeners();
  }

// Add Student To DataBase
  Future<dynamic> addStudentDatabase(context) async {
    try {
      loading = true;
      notifyListeners();

      // Define your API endpoint URL as a constant

      String fileName = profileImage!.path.split('/').last;

      FormData formData = FormData.fromMap({
        "password": pass,
        "retype_password": cpass,
        "username": fullname,
        "gender": gender,
        "user_id": userid,
        "schoolkey": schoolKey,
        "dob": dobdate,
        "user_class": userClass,
        "status_title": status,
        "status_description": statusdesc,
        "about": about,
        "phone": phone,
        "email": email,
        "address": address,
        'user_image': await MultipartFile.fromFile(profileImage!.path,
            filename: fileName),
      });

      Response response =
          await dio.post("$apiUrl/create_student_profile", data: formData);

      loading = false;

      notifyListeners();
      if (response.statusCode == 200) {
        showSnackBar(
          context,
          message: "Profile is Successfully Created",
          color: Colors.green,
        );
        var username = response.data;
        resetFormState();
        return username;
      } else {
        showSnackBar(
          context,
          message: 'Sumthing Want Wrong!',
          color: Colors.red,
        );
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          showSnackBar(
            context,
            message: e.response!.data['error'],
            color: Colors.red,
          );
        } else {
          showSnackBar(
            context,
            message: 'Sumthing Want Wrong!',
            color: Colors.red,
          );
        }
      } else {
        showSnackBar(
          context,
          message: 'Sumthing Want Wrong!',
          color: Colors.red,
        );
      }
      loading = false;
      notifyListeners();
      return false;
    }
  }

  // Create Student End
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////

// Add Teacher To DataBase
  Future<dynamic> addTeacherDatabase(context) async {
    try {
      loading = true;
      notifyListeners();

      // Define your API endpoint URL as a constant

      String fileName = profileImage!.path.split('/').last;

      FormData formData = FormData.fromMap({
        "password": pass,
        "retype_password": cpass,
        "username": fullname,
        "gender": gender,
        "userid_name": userid,
        "schoolkey": schoolKey,
        "dob": dobdate,
        "languages": teachingsubjects,
        "user_designation": status,
        "user_description": statusdesc,
        "user_about": about,
        "phone": phone,
        "email": email,
        "city": address,
        'user_image': await MultipartFile.fromFile(profileImage!.path,
            filename: fileName),
      });

      Response response =
          await dio.post("$apiUrl/create_teacher", data: formData);

      loading = false;
      notifyListeners();
      print(response.data);
      if (response.statusCode == 200) {
        showSnackBar(
          context,
          message: "Profile is Successfully Created",
          color: Colors.green,
        );
        var username = userid;
        resetFormState();
        return username;
      } else {
        showSnackBar(
          context,
          message: 'Sumthing Want Wrong!',
          color: Colors.red,
        );
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        if (e.response!.statusCode == 400) {
          showSnackBar(
            context,
            message: e.response!.data['error'],
            color: Colors.red,
          );
        } else {
          showSnackBar(
            context,
            message: 'Sumthing Want Wrong!',
            color: Colors.red,
          );
        }
      } else {
        showSnackBar(
          context,
          message: 'Sumthing Want Wrong!',
          color: Colors.red,
        );
      }
      loading = false;
      notifyListeners();
      return false;
    }
  }

  ////////////////////////////////////////////////////////////

// Add Parent To DataBase

  Future<dynamic> addParentDatabase(context) async {
    try {
      loading = true;
      notifyListeners();

      // Define your API endpoint URL as a constant

      String fileName = profileImage!.path.split('/').last;

      FormData formData = FormData.fromMap({
        "parent_password": pass,
        "retype_password": cpass,
        "parent_name": fullname,
        "parent_gender": gender,
        "parent_useridname": userid,
        "parent_age": dobdate,
        "parent_about": about,
        "parent_phone": phone,
        "parent_email": email,
        "parent_city": address,
        "user_image": await MultipartFile.fromFile(profileImage!.path,
            filename: fileName),
      });

      Response response =
          await dio.post("$apiUrl/create_parent_profile", data: formData);

      loading = false;
      notifyListeners();
      print(response.data);
      if (response.statusCode == 200) {
        showSnackBar(
          context,
          message: "Profile is Successfully Created",
          color: Colors.green,
        );
        var username = userid;
        resetFormState();
        return username;
      } else {
        showSnackBar(
          context,
          message: 'Sumthing Want Wrong!',
          color: Colors.red,
        );
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        if (e.response!.statusCode == 400) {
          showSnackBar(
            context,
            message: e.response!.data['error'],
            color: Colors.red,
          );
        } else {
          showSnackBar(
            context,
            message: 'Sumthing Want Wrong!',
            color: Colors.red,
          );
        }
      } else {
        showSnackBar(
          context,
          message: 'Sumthing Want Wrong!',
          color: Colors.red,
        );
      }

      loading = false;
      notifyListeners();
      return false;
    }
  }
}
