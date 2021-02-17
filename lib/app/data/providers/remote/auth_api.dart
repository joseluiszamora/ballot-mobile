import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
import 'package:mobiletelefericovirtual/app/data/models/token.dart';
import 'package:mobiletelefericovirtual/app/utils/config.dart';

class AuthAPI {
  final Dio _dio = Get.find<Dio>();

  AuthAPI() {
    _dio.options.baseUrl = Config.BASE_MT_VIRTUAL_LOCAL;
  }

  Future<Token> signIn(
      {@required String username, @required String password}) async {
    final response = await _dio.post("/api/v1/auth/mobile/sign-in",
        data: {"username": username, "password": password});

    return Token.fromJson(response.data);
  }
}
