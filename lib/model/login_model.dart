
// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int statusCode;
  String authToken;
  JwtToken jwtToken;
  UserData userData;

  LoginModel({
    required this.statusCode,
    required this.authToken,
    required this.jwtToken,
    required this.userData,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    statusCode: json["status_code"],
    authToken: json["auth_token"],
    jwtToken: JwtToken.fromJson(json["jwt_token"]),
    userData: UserData.fromJson(json["userData"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "auth_token": authToken,
    "jwt_token": jwtToken.toJson(),
    "userData": userData.toJson(),
  };
}

class JwtToken {
  String refresh;
  String access;

  JwtToken({
    required this.refresh,
    required this.access,
  });

  factory JwtToken.fromJson(Map<String, dynamic> json) => JwtToken(
    refresh: json["refresh"],
    access: json["access"],
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
  };
}

class UserData {
  int id;
  String name;
  String email;
  dynamic mobileNo;
  String naivisionId;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.naivisionId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobileNo: json["mobile_no"],
    naivisionId: json["naivision_id"] != null ? json["naivision_id"] : "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile_no": mobileNo,
    "naivision_id": naivisionId,
  };
}
