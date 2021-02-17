import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
import 'package:mobiletelefericovirtual/app/data/models/user_register.dart';
import 'package:mobiletelefericovirtual/app/data/providers/remote/users_api.dart';

class UsersRepository {
  final UsersAPI _usersAPI = Get.find<UsersAPI>();

  Future registerUser({@required UserRegister user}) =>
      _usersAPI.registerUser(user);
}
