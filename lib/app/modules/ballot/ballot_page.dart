import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/route_manager.dart';
import 'package:mobiletelefericovirtual/app/data/models/candidate.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/app_bar/main_app_bar_widget.dart';
import 'package:mobiletelefericovirtual/app/routes/app_routes.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';

class BallotPage extends StatelessWidget {
  BallotPage({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  Widget formCandidates(BuildContext context, Candidate candidate) {
    return Column(children: [
      Row(children: <Widget>[
        new Expanded(
            flex: 2,
            child: Column(children: <Widget>[
              Image.asset(candidate.image, width: 50.0),
              Text(candidate.politicalParty,
                  style: TextStyle(fontWeight: FontWeight.bold))
            ])),
        new Expanded(
            flex: 2,
            child: Column(children: <Widget>[
              new Text(candidate.name, textAlign: TextAlign.center)
            ])),
        new Expanded(
            flex: 2,
            child: Column(children: <Widget>[
              new FormBuilderTextField(
                  name: candidate.politicalParty,
                  keyboardType: TextInputType.number,
                  initialValue: candidate.votes.toString(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Numero de votos'),
                  validator: FormBuilderValidators.required(context,
                      errorText: 'Campo Obligatorio'))
            ]))
      ]),
      SizedBox(height: 20.0)
    ]);
  }

  Widget listCandidates(BuildContext context, List<Candidate> candidates) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < candidates.length; i++) {
      list.add(formCandidates(context, candidates[i]));
    }
    return Column(children: list);
  }

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
                        child: Column(children: <Widget>[
                          FormBuilder(
                              key: _formKey,
                              child: Column(children: [
                                listCandidates(
                                    context, Candidate().alcaldiaList()),
                                SizedBox(height: 10),
                                FlatButton(
                                    onPressed: () {
                                      if (_formKey.currentState
                                          .saveAndValidate()) {
                                        print("OK....");
                                        Get.offNamed(
                                            AppRoutes.BALLOT_IMAGE_REPORT);
                                      } else {
                                        print("FAIL....");
                                      }
                                    },
                                    color: Colors.black,
                                    child: Text("Siguiente",
                                        style: TextStyle(color: Colors.white)))
                              ]))
                        ]),
                      )),
                ))
          ]),
        ));
  }
}
