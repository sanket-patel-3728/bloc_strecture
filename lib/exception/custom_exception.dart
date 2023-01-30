class NetworkException implements Exception {
  String noInternetMessage = "There is No Internet";

  NetworkException({this.noInternetMessage = "There is No Internet"});
}
