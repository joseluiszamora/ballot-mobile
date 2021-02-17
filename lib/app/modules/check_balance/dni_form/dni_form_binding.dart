import 'package:get/get.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/dni_form/dni_form_controller.dart';

class DNIFormBinding extends Bindings {
  void dependencies() {
    Get.lazyPut(() => DNIFormController());
  }
}
