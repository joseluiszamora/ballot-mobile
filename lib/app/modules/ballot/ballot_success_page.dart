import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/route_manager.dart';
import 'package:mobiletelefericovirtual/app/data/models/candidate.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/app_bar/main_app_bar_widget.dart';
import 'package:mobiletelefericovirtual/app/routes/app_routes.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';

class BallotSuccessPage extends StatelessWidget {
  BallotSuccessPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBarWidget(title: 'VOTACIÓN MUNICIPAL'),
        body: Container(
          decoration: Styles().backgroundMain(),
          child: Column(children: [
            Flexible(
                flex: 1,
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "Registro realizado correctamente.",
                                            style: TextStyle(fontSize: 30),
                                            textAlign: TextAlign.center),
                                        SizedBox(height: 50),
                                        Center(
                                          child: FlatButton(
                                              onPressed: () {
                                                Get.offNamed(
                                                    AppRoutes.DASHBOARD);
                                              },
                                              color: Colors.black,
                                              child: Text("REGRESAR",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        )
                                      ]))
                            ]),
                        //child: Column(children: <Widget>[Text("Successsss")]),
                      )),
                ))
          ]),
        ));
  }
}
