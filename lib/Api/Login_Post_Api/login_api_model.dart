class LoginModel {
  bool? status;
  String? message;
  int? statusCode;
  String? token;
  Data? data;
  NotificationStatus? notificationStatus;

  LoginModel(
      {this.status,
        this.message,
        this.statusCode,
        this.token,
        this.data,
        this.notificationStatus});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    notificationStatus = json['notification_status'] != null
        ? new NotificationStatus.fromJson(json['notification_status'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.notificationStatus != null) {
      data['notification_status'] = this.notificationStatus!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? profileImage;
  String? email;
  Null? emailVerifiedAt;
  int? role;
  String? phone;
  String? countryCode;
  Null? countryFlag;
  String? phoneFlag;
  String? deviceId;
  int? phoneVerification;
  int? status;
  String? fcmToken;
  Null? socialId;
  Null? loginType;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.firstName,
        this.lastName,
        this.profileImage,
        this.email,
        this.emailVerifiedAt,
        this.role,
        this.phone,
        this.countryCode,
        this.countryFlag,
        this.phoneFlag,
        this.deviceId,
        this.phoneVerification,
        this.status,
        this.fcmToken,
        this.socialId,
        this.loginType,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['Role'];
    phone = json['phone'];
    countryCode = json['country_code'];
    countryFlag = json['country_flag'];
    phoneFlag = json['phone_flag'];
    deviceId = json['device_id'];
    phoneVerification = json['phone_verification'];
    status = json['status'];
    fcmToken = json['fcm_token'];
    socialId = json['social_id'];
    loginType = json['login_type'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['Role'] = this.role;
    data['phone'] = this.phone;
    data['country_code'] = this.countryCode;
    data['country_flag'] = this.countryFlag;
    data['phone_flag'] = this.phoneFlag;
    data['device_id'] = this.deviceId;
    data['phone_verification'] = this.phoneVerification;
    data['status'] = this.status;
    data['fcm_token'] = this.fcmToken;
    data['social_id'] = this.socialId;
    data['login_type'] = this.loginType;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class NotificationStatus {
  int? id;
  int? userId;
  int? status;
  String? createdAt;
  String? updatedAt;

  NotificationStatus(
      {this.id, this.userId, this.status, this.createdAt, this.updatedAt});

  NotificationStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}