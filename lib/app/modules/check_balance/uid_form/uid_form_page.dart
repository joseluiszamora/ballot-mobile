import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/app_bar/return_app_bar_widget.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/buttons/button_primary_widget.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/uid_form/uid_form_controller.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';
import 'package:mobiletelefericovirtual/app/utils/helper.dart';

class UIDFormPage extends StatelessWidget {
  UIDFormPage({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UIDFormController>(
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
                      'Para consultar el saldo de la tarjeta digite el codigo UID que se encuentra grabada en la tarjeta.',
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
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'UID'),
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
                            _.getBalanceByUID(
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
