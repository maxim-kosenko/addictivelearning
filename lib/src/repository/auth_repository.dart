import 'package:addictivelearning/src/models/user.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  String url = "https://dev.addictivelearning.io";

  Future<void> register(User user) async {
    await Dio()
        .post('$url/api/v1/register', data: user.toJson())
        .then((response) {
      if (response.statusCode != 200) {
        throw response.data;
      }
      print(response.data);
    });
  }
}
