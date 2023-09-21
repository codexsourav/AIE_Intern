class StudentProfileModel {
  String? sId;
  String? dob;
  String? gender;
  String? password;
  PersonalInfo? personalInfo;
  String? role;
  String? schoolkey;
  String? statusDescription;
  String? statusTitle;
  String? userClass;
  String? userId;
  String? userImage;
  String? username;

  StudentProfileModel(
      {this.sId,
      this.dob,
      this.gender,
      this.password,
      this.personalInfo,
      this.role,
      this.schoolkey,
      this.statusDescription,
      this.statusTitle,
      this.userClass,
      this.userId,
      this.userImage,
      this.username});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    dob = json['dob'];
    gender = json['gender'];
    password = json['password'];
    personalInfo = json['personal_info'] != null
        ? PersonalInfo.fromJson(json['personal_info'])
        : null;
    role = json['role'];
    schoolkey = json['schoolkey'];
    statusDescription = json['status_description'];
    statusTitle = json['status_title'];
    userClass = json['user_class'];
    userId = json['user_id'];
    userImage = json['user_image'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['dob'] = dob;
    data['gender'] = gender;
    data['password'] = password;
    if (personalInfo != null) {
      data['personal_info'] = personalInfo!.toJson();
    }
    data['role'] = role;
    data['schoolkey'] = schoolkey;
    data['status_description'] = statusDescription;
    data['status_title'] = statusTitle;
    data['user_class'] = userClass;
    data['user_id'] = userId;
    data['user_image'] = userImage;
    data['username'] = username;
    return data;
  }
}

class PersonalInfo {
  String? about;
  Contact? contact;

  PersonalInfo({this.about, this.contact});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    contact =
        json['contact'] != null ? Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['about'] = about;
    if (contact != null) {
      data['contact'] = contact!.toJson();
    }
    return data;
  }
}

class Contact {
  String? address;
  String? email;
  String? phone;

  Contact({this.address, this.email, this.phone});

  Contact.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['address'] = address;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
