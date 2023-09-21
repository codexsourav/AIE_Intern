import 'package:flutter/material.dart';
import 'package:schoolpenintern/data/Network/api_network.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/StudentProfilemodels.dart';

class UserProfileProvider extends ChangeNotifier {
  String? dbid;
  String? userid;
  String? roal;
  StudentProfileModel? profileData;

  Future setUSerAuthCradencials({id, usernameid, useroal}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("dbid", id);
    prefs.setString("user_id", usernameid);
    prefs.setString("roal", useroal);
    dbid = id;
    userid = usernameid;
    roal = useroal;
    return await getUserProfileData(roal: useroal, userid: usernameid);
  }

  Future getUserProfileData({userid, roal}) async {
    try {
      if (roal == "student") {
        var data = await ApiNetwork.sendGetRequest('/get_user/' + userid);
        profileData = StudentProfileModel.fromJson(data);
      }
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
