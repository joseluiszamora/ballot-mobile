import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/route_manager.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/buttons/button_principal_widget.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/buttons/button_secondary_widget.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/app_bar/main_app_bar_widget.dart';
import 'package:mobiletelefericovirtual/app/modules/check_balance/check_balance_page.dart';
import 'package:mobiletelefericovirtual/app/modules/register/step_one/step_one_form.dart';
import 'package:mobiletelefericovirtual/app/routes/app_routes.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';
import 'package:mobiletelefericovirtual/app/utils/parse_values.dart';

class BallotPage extends StatelessWidget {
  BallotPage({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBarWidget(title: 'REPORTAR VOTACIÓN'),
        body: Container(
          decoration: Styles().backgroundMain(),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(), 
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[Image.asset("assets/ballot/mas.png", width: 50.0,)],
                              )),
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[new Text('MAS')],
                              )),
                              new Expanded( 
                                flex :2,
                                child: Column(
                                children: <Widget>[
                                  new FormBuilderTextField(
                                    name: "name",
                                    initialValue: "0",
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Numero de votos'),
                                    validator: FormBuilderValidators
                                        .required(context, errorText: 'Campo Obligatorio'))
                                ]))]),
                          SizedBox(height: 30.0),
                          Row(
                            children: <Widget>[
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[Image.asset("assets/ballot/arias.png", width: 50.0,)],
                              )),
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[new Text('SP')],
                              )),
                              new Expanded( 
                                flex :2,
                                child: Column(
                                children: <Widget>[
                                  new FormBuilderTextField(
                                    name: "name",
                                    initialValue: "0",
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Numero de votos'),
                                    validator: FormBuilderValidators
                                        .required(context, errorText: 'Campo Obligatorio'))
                                ]))]),
                          SizedBox(height: 30.0),
                          Row(
                            children: <Widget>[
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[Image.asset("assets/ballot/nologo.png", width: 50.0,)],
                              )),
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[new Text('SOL.BO')],
                              )),
                              new Expanded( 
                                flex :2,
                                child: Column(
                                children: <Widget>[
                                  new FormBuilderTextField(
                                    name: "name",
                                    initialValue: "0",
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Numero de votos'),
                                    validator: FormBuilderValidators
                                        .required(context, errorText: 'Campo Obligatorio'))
                                ]))]),
                          SizedBox(height: 30.0),
                          Row(
                            children: <Widget>[
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[Image.asset("assets/ballot/nologo.png", width: 50.0,)],
                              )),
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[new Text('JALLALLA')],
                              )),
                              new Expanded( 
                                flex :2,
                                child: Column(
                                children: <Widget>[
                                  new FormBuilderTextField(
                                    name: "name",
                                    initialValue: "0",
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Numero de votos'),
                                    validator: FormBuilderValidators
                                        .required(context, errorText: 'Campo Obligatorio'))
                                ]))]),
                          SizedBox(height: 30.0),
                          Row(
                            children: <Widget>[
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[Image.asset("assets/ballot/nologo.png", width: 50.0,)],
                              )),
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[new Text('MPS')],
                              )),
                              new Expanded( 
                                flex :2,
                                child: Column(
                                children: <Widget>[
                                  new FormBuilderTextField(
                                    name: "name",
                                    initialValue: "0",
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Numero de votos'),
                                    validator: FormBuilderValidators
                                        .required(context, errorText: 'Campo Obligatorio'))
                                ]))]),
                          SizedBox(height: 30.0),
                          Row(
                            children: <Widget>[
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[Image.asset("assets/ballot/nologo.png", width: 50.0,)],
                              )),
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[new Text('PAN BOL')],
                              )),
                              new Expanded( 
                                flex :2,
                                child: Column(
                                children: <Widget>[
                                  new FormBuilderTextField(
                                    name: "name",
                                    initialValue: "0",
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Numero de votos'),
                                    validator: FormBuilderValidators
                                        .required(context, errorText: 'Campo Obligatorio'))
                                ]))]),
                          SizedBox(height: 30.0),
                          Row(
                            children: <Widget>[
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[Image.asset("assets/ballot/nologo.png", width: 50.0,)],
                              )),
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[new Text('CC')],
                              )),
                              new Expanded( 
                                flex :2,
                                child: Column(
                                children: <Widget>[
                                  new FormBuilderTextField(
                                    name: "name",
                                    initialValue: "0",
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Numero de votos'),
                                    validator: FormBuilderValidators
                                        .required(context, errorText: 'Campo Obligatorio'))
                                ]))]),
                          SizedBox(height: 30.0),
                          Row(
                            children: <Widget>[
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[Image.asset("assets/ballot/nologo.png", width: 50.0,)],
                              )),
                              new Expanded ( 
                                flex:2,
                                child : Column(
                                children: <Widget>[new Text('VENCEREMOS')],
                              )),
                              new Expanded( 
                                flex :2,
                                child: Column(
                                children: <Widget>[
                                  new FormBuilderTextField(
                                    name: "name",
                                    initialValue: "0",
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Numero de votos'),
                                    validator: FormBuilderValidators
                                        .required(context, errorText: 'Campo Obligatorio'))
                                ]))]),
                        ],
                      ),
                    )
                  ),

                ),
              )
            ],
          ),
        ));
  }
}
