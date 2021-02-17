import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/state_manager.dart';

import 'package:mobiletelefericovirtual/app/global_widgets/app_bar/return_app_bar_widget.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/buttons/button_primary_widget.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/dni_form/dni_form_controller.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';
import 'package:mobiletelefericovirtual/app/utils/helper.dart';

class DNIFormPage extends StatelessWidget {
  DNIFormPage({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DNIFormController>(
        builder: (_) => Scaffold(
            appBar: ReturnAppBarWidget(title: 'SALDO POR DOCUMENTO'),
            body: Container(
              decoration: Styles().backgroundMain(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Center(
                        child: Text(
                      'Para consultar el saldo por documento de identidad digite su numero de documento, a continuación haga click en el botón consultar.',
                      textAlign: TextAlign.center,
                      style: Styles().textOne(),
                    )),
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                      child: FormBuilder(
                          key: _formKey,
                          child: Column(children: [
                            FormBuilderTextField(
                                name: "documento",
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Documento'),
                                validator: FormBuilderValidators.required(
                                    context,
                                    errorText: 'Campo Obligatorio'))
                          ])),
                    ),
                    SizedBox(height: 20),
                    ButtonPrimaryWidget(
                        title: 'Consultar',
                        onPressed: () async {
                          if (_formKey.currentState.saveAndValidate()) {
                            print("consultar Button");
                            _.getBalanceByDNI(
                                _formKey.currentState.value, context);
                          } else {
                            Helper().showToastBottom(
                                'Completa los datos faltantes');
                          }
                        })
                  ],
                ),
              ),
            )));
  }
}
