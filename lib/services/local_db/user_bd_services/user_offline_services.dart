import 'dart:convert';

import 'package:api_call/constants/constants.dart';
import 'package:api_call/models/UserModel.dart';
import 'package:api_call/services/local_db/database_services.dart';

import '../../../repository/user_repository/UserRepository.dart';

class UserOfflineService implements UserServices {
  @override
  Future<List<User>> getUserList() async {
    List<User> userList = [];

    List<Map<String, dynamic>> data =
        await DatabaseHelper.instance.queryAll(DbConstants.USER_TABLE_NAME);
    for (var element in data) {
      userList.add(User.fromJson(jsonDecode(element["data"])));
    }
    return userList;
  }
}
