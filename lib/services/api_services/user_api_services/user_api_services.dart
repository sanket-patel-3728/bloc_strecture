import 'package:api_call/services/local_db/database_services.dart';
import 'package:dio/dio.dart';
import '../../../constants/constants.dart';
import '../../../models/UserModel.dart';
import '../../../repository/user_repository/UserRepository.dart';
import '../../dio_sevices/DioClient.dart';

class UserApiServices implements UserServices {
  @override
  Future<List<User>> getUserList() async {
    List<User> userList = [];

    try {
      Response response = await DioClient.getClient()!
          .get(APIConstants.USER_API, queryParameters: {"page": "2"});

      if (response.statusCode == 200) {
        if (response.data != null) {
          response.data["data"]
              .map((e) => userList.add(User.fromJson(e)))
              .toList();
          DatabaseHelper.instance.delete(DbConstants.USER_TABLE_NAME);
          for (var user in userList) {
            user.insertIntoDatabase();
          }
          await Future.delayed(const Duration(seconds: 2));
          return userList;
        }
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      if (e is DioError) {
        throw Exception(e.message);
      }
      throw Exception(e);
    }
    return userList;
  }
}
