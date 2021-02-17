import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobiletelefericovirtual/app/data/models/user_register.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/app_bar/return_app_bar_widget.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/buttons/button_primary_widget.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/buttons/button_secondary_widget.dart';
import 'package:mobiletelefericovirtual/app/modules/dashboard/dashboard_page.dart';
import 'package:mobiletelefericovirtual/app/modules/register/step_one/step_one_form_controller.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';
import 'package:mobiletelefericovirtual/app/utils/helper.dart';
import 'package:mobiletelefericovirtual/app/utils/parse_values.dart';
import 'package:intl/intl.dart';

class StepOneFormPage extends StatelessWidget {
  StepOneFormPage({Key key, this.user}) : super(key: key);

  final UserRegister user;
  final _formKey = GlobalKey<FormBuilderState>();

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
                  title: Text("Desea cancelar el registro?"),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text("Ahora NO")),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) {
                            return DashboardPage();
                          }), (route) => false);
                        },
                        child: Text("SI, Cancelar"))
                  ],
                ))) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StepOneFormController>(
        builder: (_) => WillPopScope(
            onWillPop: () => _onWillPop(context),
            child: Scaffold(
              appBar: ReturnAppBarWidget(title: 'MIS TARJETAS'),
              body: Container(
                decoration: Styles().backgroundMain(),
                child: Column(
                  children: [
                    Flexible(
                        flex: 1,
                        child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                child: SingleChildScrollView(
                                    physics: ClampingScrollPhysics(),
                                    child: Column(children: <Widget>[
                                      FormBuilder(
                                        key: _formKey,
                                        child: Column(
                                          children: <Widget>[
                                            FormBuilderTextField(
                                                name: "name",
                                                initialValue: cleanStringToForm(
                                                    user.name),
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: 'Nombres'),
                                                validator: FormBuilderValidators
                                                    .required(context,
                                                        errorText:
                                                            'Campo Obligatorio')),
                                            SizedBox(height: 15),
                                            FormBuilderTextField(
                                                name: "lastname",
                                                initialValue: cleanStringToForm(
                                                    user.lastName),
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: 'Apellidos'),
                                                validator: FormBuilderValidators
                                                    .required(context,
                                                        errorText:
                                                            'Campo Obligatorio')),
                                            SizedBox(height: 15),
                                            FormBuilderRadioGroup(
                                              name: 'nationality',
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Nacionalidad'),
                                              onChanged: (val) {
                                                if (val == 'Extranjero') {
                                                  _.setShowFieldsExtranjero(
                                                      true);
                                                } else {
                                                  _.setShowFieldsExtranjero(
                                                      false);
                                                }
                                              },
                                              initialValue: 'Boliviano',
                                              validator: FormBuilderValidators
                                                  .required(context,
                                                      errorText:
                                                          'Campo Obligatorio'),
                                              options: [
                                                'Boliviano',
                                                'Extranjero'
                                              ]
                                                  .map((lang) =>
                                                      FormBuilderFieldOption(
                                                          value: lang))
                                                  .toList(growable: false),
                                            ),
                                            SizedBox(height: 15),
                                            _.showFieldsExtranjero
                                                ? _fieldsExtranjero(context)
                                                : _fieldsBoliviano(context,
                                                    user.expedidoList()),
                                            SizedBox(height: 15),
                                            Container(
                                                child: Row(children: [
                                              Flexible(
                                                  flex: 1,
                                                  child:
                                                      FormBuilderDateTimePicker(
                                                          name: 'birthdate',
                                                          inputType:
                                                              InputType.date,
                                                          format: DateFormat(
                                                              "dd-MM-yyyy"),
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'Nacimiento',
                                                          ),
                                                          validator:
                                                              FormBuilderValidators
                                                                  .required(
                                                                      context,
                                                                      errorText:
                                                                          'Campo Obligatorio'),
                                                          initialDate:
                                                              DateTime.now())),
                                              SizedBox(width: 10.0),
                                              Flexible(
                                                  flex: 1,
                                                  child: FormBuilderTextField(
                                                      name: "phone",
                                                      keyboardType:
                                                          TextInputType.number,
                                                      initialValue:
                                                          cleanStringToForm(
                                                              user.phone),
                                                      decoration: InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText: 'Teléfono',
                                                          prefixIcon: Icon(
                                                              Icons.phone)),
                                                      validator:
                                                          FormBuilderValidators
                                                              .required(context,
                                                                  errorText:
                                                                      'Campo Obligatorio')))
                                            ])),
                                            SizedBox(height: 50.0),
                                          ],
                                        ),
                                      )
                                    ]))))),
                    Container(
                        decoration: Styles().bottomBarMain(),
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ButtonSecondaryWidget(
                                  title: 'Cancelar', onPressed: _onWillPop),
                              SizedBox(width: 100.0),
                              ButtonPrimaryWidget(
                                  title: 'Siguiente',
                                  onPressed: () {
                                    if (_formKey.currentState
                                        .saveAndValidate()) {
                                      _.updateUserRegister(context,
                                          _formKey.currentState.value, user);
                                    } else {
                                      Helper().showToastBottom(
                                          'Completa los datos faltantes');
                                    }
                                  })
                            ]))
                  ],
                ),
              ),
            )));
  }

  Widget _fieldsBoliviano(BuildContext context, List<String> expedidoList) {
    return Container(
        child: Row(children: [
      Flexible(
          flex: 3,
          child: FormBuilderTextField(
              name: "document",
              keyboardType: TextInputType.number,
              initialValue: cleanStringToForm(user.document),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'CI'),
              validator: FormBuilderValidators.required(context,
                  errorText: 'Campo Obligatorio'))),
      SizedBox(width: 10.0),
      Flexible(
          flex: 2,
          child: FormBuilderDropdown(
              name: 'expedido',
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Expedido'),
              hint: Text('Expedido en:'),
              validator: FormBuilderValidators.required(context,
                  errorText: 'Campo Obligatorio'),
              items: expedidoList
                  .map((gender) =>
                      DropdownMenuItem(value: gender, child: Text('$gender')))
                  .toList(),
              allowClear: true)),
    ]));
  }

  Widget _fieldsExtranjero(BuildContext context) {
    return Container(
        child: Row(children: [
      Flexible(
          flex: 1,
          child: FormBuilderTextField(
              name: "documentext",
              keyboardType: TextInputType.number,
              initialValue: cleanStringToForm(user.document),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'DNI'),
              validator: FormBuilderValidators.required(context,
                  errorText: 'Campo Obligatorio'))),
      SizedBox(width: 10.0),
      /*Flexible(
          flex: 1,
          child: FormBuilderCountryPicker(
              initialValue: 'Germany',
              attribute: 'country',
              dialogTitle: Text('Seleccione Pais'),
              cursorColor: Colors.black,
              priorityListByIsoCode: ['ES'],
              valueTransformer: (value) {
                return value.isoCode;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'País'),
              validators: [
                FormBuilderValidators.required(context,
                    errorText: 'Campo Obligatorio')
              ]))*/
      Flexible(
          flex: 1,
          child: FormBuilderSearchableDropdown(
              initialValue: 'Germany',
              name: 'country',
              popupTitle: Text('Seleccione Pais'),
              /*cursorColor: Colors.black,
              priorityListByIsoCode: ['ES'],*/
              valueTransformer: (value) {
                return value.isoCode;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'País'),
              validator: FormBuilderValidators.required(context,
                  errorText: 'Campo Obligatorio')))
    ]));
  }
}
