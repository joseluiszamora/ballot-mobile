import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
import 'package:mobiletelefericovirtual/app/data/providers/remote/auth_api.dart';
import 'package:mobiletelefericovirtual/app/data/providers/remote/cards_api.dart';

class AuthRepository {
  final AuthAPI _authAPI = Get.find<AuthAPI>();

  Future signIn({@required String username, @required String password}) =>
      _authAPI.signIn(username: username, password: password);
}
