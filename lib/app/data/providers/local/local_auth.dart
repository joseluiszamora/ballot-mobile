import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobiletelefericovirtual/app/data/models/token.dart';

class LocalAuth {
  static const KEY = "session";
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setSession(Token token) async {
    await _storage.write(key: KEY, value: jsonEncode(token.toJson()));
  }

  Future<void> clearSession() async {
    await _storage.delete(key: KEY);
  }

  Future<Token> getSession() async {
    final String data = await _storage.read(key: KEY);
    if (data != null) {
      final Token token = Token.fromJson(jsonDecode(data));
      bool isExpired = JwtDecoder.isExpired(token.token);
      if (isExpired) {
        return token;
      }
      return null;
    }
    return null;
  }
}
