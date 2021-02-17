import 'package:get/instance_manager.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/dni_form/dni_form_controller.dart';

class UIDFormBinding extends Bindings {
  void dependencies() {
    Get.lazyPut(() => DNIFormController());
  }
}
