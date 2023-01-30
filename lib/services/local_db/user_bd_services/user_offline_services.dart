import 'package:api_call/exception/custom_exception.dart';
import 'package:api_call/models/UserModel.dart';

import '../../../repository/user_repository/UserRepository.dart';

class UserOfflineService implements UserServices {
  @override
  Future<List<User>> getUserList() async {
    /// If : suppose there is not use of this method for local db
    throw NetworkException(
        noInternetMessage: "To Load User list Internet is Required.");

    /// Comment NetworkException to Return static Data when internet is Off..
    List<User> userList = [];
    dynamic data = {
      "page": 2,
      "per_page": 6,
      "total": 12,
      "total_pages": 2,
      "data": [
        {
          "id": 7,
          "email": "michael.lawson@reqres.in",
          "first_name": "Michael",
          "last_name": "Lawson",
          "avatar": ""
        },
        {
          "id": 8,
          "email": "lindsay.ferguson@reqres.in",
          "first_name": "Lindsay",
          "last_name": "Ferguson",
          "avatar": ""
        },
        {
          "id": 9,
          "email": "tobias.funke@reqres.in",
          "first_name": "Tobias",
          "last_name": "Funke",
          "avatar": ""
        },
        {
          "id": 10,
          "email": "byron.fields@reqres.in",
          "first_name": "Byron",
          "last_name": "Fields",
          "avatar": ""
        },
        {
          "id": 11,
          "email": "george.edwards@reqres.in",
          "first_name": "George",
          "last_name": "Edwards",
          "avatar": ""
        },
      ],
      "support": {
        "url": "https://reqres.in/#support-heading",
        "text":
            "To keep ReqRes free, contributions towards server costs are appreciated!"
      }
    };
    data["data"].map((e) => userList.add(User.fromJson(e))).toList();
    return userList;
  }
}
