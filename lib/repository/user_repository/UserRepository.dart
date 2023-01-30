import '../../models/UserModel.dart';
import '../../services/api_services/user_api_services/user_api_services.dart';
import '../../services/local_db/user_bd_services/user_offline_services.dart';
import '../../services/network_services/network_services.dart';

class UserRepository {
  Future<List<User>> getUserData() async {
    return await UserServices().getUserList();
  }
}

/// Define all API Methods for users which is for Rest API and Local
abstract class UserServices {
  factory UserServices() =>
      NetworkHelper.checkInternet() ? UserApiServices() : UserOfflineService();

  Future<List<User>> getUserList();
}
