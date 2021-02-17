import 'package:get/get.dart';
import 'package:mobiletelefericovirtual/app/data/models/token.dart';
import 'package:mobiletelefericovirtual/app/data/providers/local/local_auth.dart';

class LocalAuthRepository {
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  Future<void> setSession(Token token) => _localAuth.setSession(token);

  Future<void> clearSession() => _localAuth.clearSession();

  Future<Token> get session => _localAuth.getSession();
}
