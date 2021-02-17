import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobiletelefericovirtual/app/data/models/token.dart';
import 'package:mobiletelefericovirtual/app/data/respositories/local/local_auth_repository.dart';
import 'package:mobiletelefericovirtual/app/routes/app_routes.dart';

class SplashController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    try {
      final Token token = await _localAuthRepository.session;
      print("token");
      print(token);
      Get.offNamed(AppRoutes.LOGIN);
      Get.offNamed(token != null ? AppRoutes.DASHBOARD : AppRoutes.LOGIN);
    } catch (e) {
      print(e);
    }
  }
}
