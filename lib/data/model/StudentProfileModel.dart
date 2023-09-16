class StudentModel {
  String? sId;

  PersonalInfo? personalInfo;
  String? statusDescription;
  String? statusTitle;
  String? userClass;
  String? userId;
  String? userImage;
  String? username;
  Map? attendance;
  Map? interest;
  Map? performance;

  StudentModel({
    this.sId,
    this.personalInfo,
    this.statusDescription,
    this.statusTitle,
    this.userClass,
    this.userId,
    this.attendance,
    this.interest,
    this.performance,
    this.userImage,
    this.username,
  });

  StudentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];

    personalInfo = json['personal_info'] != null
        ? new PersonalInfo.fromJson(json['personal_info'])
        : null;
    statusDescription = json['status_description'];
    statusTitle = json['status_title'];
    userClass = json['user_class'];
    userId = json['user_id'];
    userImage = json['user_image'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;

    if (this.personalInfo != null) {
      data['personal_info'] = this.personalInfo!.toJson();
    }
    data['status_description'] = this.statusDescription;
    data['status_title'] = this.statusTitle;
    data['user_class'] = this.userClass;
    data['user_id'] = this.userId;
    data['user_image'] = this.userImage;
    data['username'] = this.username;
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
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
