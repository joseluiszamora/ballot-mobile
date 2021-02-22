import 'package:get/route_manager.dart';
import 'package:mobiletelefericovirtual/app/modules/auth/login_binding.dart';
import 'package:mobiletelefericovirtual/app/modules/auth/login_page.dart';
import 'package:mobiletelefericovirtual/app/modules/ballot/ballot_image_page.dart';
import 'package:mobiletelefericovirtual/app/modules/ballot/ballot_page.dart';
import 'package:mobiletelefericovirtual/app/modules/ballot/ballot_success_page.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/card_viewer_page.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/check_balance_page.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/dni_form/dni_form_binding.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/dni_form/dni_form_page.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/uid_form/uid_form_binding.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/uid_form/uid_form_page.dart';
import 'package:mobiletelefericovirtual/app/modules/dashboard/dashboard_page.dart';
import 'package:mobiletelefericovirtual/app/modules/register/step_one/step_one_form.dart';
import 'package:mobiletelefericovirtual/app/modules/register/step_one/step_one_form_binding.dart';
import 'package:mobiletelefericovirtual/app/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.DASHBOARD, page: () => DashboardPage()),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(name: AppRoutes.CHECK_BALANCE, page: () => CheckBalancePage()),
    GetPage(
        name: AppRoutes.DNI_FORM,
        page: () => DNIFormPage(),
        binding: DNIFormBinding()),
    GetPage(
        name: AppRoutes.UID_FORM,
        page: () => UIDFormPage(),
        binding: UIDFormBinding()),
    GetPage(name: AppRoutes.CARD_VIEWER, page: () => CardViewerPage()),
    GetPage(
        name: AppRoutes.REGISTER_USER,
        page: () => StepOneFormPage(),
        binding: StepOneFormBinding()),
    GetPage(name: AppRoutes.BALLOT_REPORT, page: () => BallotPage()),
    GetPage(name: AppRoutes.BALLOT_IMAGE_REPORT, page: () => BallotImagePage()),
    GetPage(name: AppRoutes.BALLOT_SUCCESS, page: () => BallotSuccessPage()),
  ];
}
