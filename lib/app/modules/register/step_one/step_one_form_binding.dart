import 'package:get/get.dart';
import 'package:mobiletelefericovirtual/app/modules/register/step_one/step_one_form_controller.dart';

class StepOneFormBinding extends Bindings {
  void dependencies() {
    Get.lazyPut(() => StepOneFormController());
  }
}
