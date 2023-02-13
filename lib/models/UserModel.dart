import 'dart:convert';

import 'package:api_call/constants/constants.dart';

import '../services/local_db/database_services.dart';

class User extends DatabaseModel {
  String? query;
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    Map<String, dynamic> finalData = {"data": jsonEncode(data)};
    return finalData;
  }

  @override
  void setQuery() {
    query = "";
  }

  @override
  String tableName() {
    return DbConstants.USER_TABLE_NAME;
  }
}

class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token, required this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String? email;
  String? password;
  String? tenant;

  LoginRequestModel({
     this.email,
     this.password,
     this.tenant,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email?.trim(),
      'password': password?.trim(),
      'token':tenant?.trim(),
    };

    return map;
  }
}
