import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/app_bar/return_app_bar_widget.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/dni_form/dni_form_page.dart';
import 'package:mobiletelefericovirtual/app/routes/app_routes.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';

class CheckBalancePage extends StatelessWidget {
  const CheckBalancePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReturnAppBarWidget(
          title: "CONSULTA DE SALDO",
        ),
        body: Container(
          decoration: Styles().backgroundMain(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Center(
                    child: Text(
                  'Verifica el saldo de tu tarjeta',
                  textAlign: TextAlign.center,
                  style: Styles().textOne(),
                )),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 220.0,
                    child: CustomRadioButton(
                        elevation: 10,
                        enableShape: true,
                        absoluteZeroSpacing: false,
                        defaultSelected: "ci",
                        unSelectedColor: Styles().colorBackgroundPrimary,
                        customShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        buttonLables: ['Por CI', 'Por UID'],
                        buttonValues: ["ci", "uid"],
                        buttonTextStyle: Styles().buttonStyleOne(),
                        selectedColor: Styles().colorPrimary,
                        radioButtonValue: (value) {
                          if (value == 'ci') {
                            Get.toNamed(AppRoutes.DNI_FORM);
                          } else {
                            Get.toNamed(AppRoutes.UID_FORM);
                          }
                        }),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ));
  }
}
