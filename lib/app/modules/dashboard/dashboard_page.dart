import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/buttons/button_principal_widget.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/buttons/button_secondary_widget.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/app_bar/main_app_bar_widget.dart';
import 'package:mobiletelefericovirtual/app/modules/ballot/ballot_page.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/check_balance_page.dart';
import 'package:mobiletelefericovirtual/app/modules/register/step_one/step_one_form.dart';
import 'package:mobiletelefericovirtual/app/routes/app_routes.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBarWidget(title: 'INICIO'),
        body: Container(
          decoration: Styles().backgroundMain(),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                Text('BIENVENIDO', style: Styles().titleOne()),
                SizedBox(height: 30.0),
                ButtonPrincipalWidget(
                    title: 'Realizar Reporte',
                    onPressed: () {
                      Get.to(BallotPage());
                    }),
                SizedBox(height: 20),
                ButtonSecondaryWidget(
                    title: "Salir",
                    onPressed: () {
                      //userRepository.signOut();
                    })
              ])),
        ));
  }
}
