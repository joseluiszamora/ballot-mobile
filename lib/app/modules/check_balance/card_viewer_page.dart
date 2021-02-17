import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobiletelefericovirtual/app/data/models/card_balance.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/app_bar/return_app_bar_widget.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';
import 'package:snaplist/snaplist.dart';

class CardViewerPage extends StatelessWidget {
  List<CardBalance> _cards;

  @override
  Widget build(BuildContext context) {
    _cards = Get.arguments as List<CardBalance>;
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: ReturnAppBarWidget(title: 'MIS TARJETAS'),
        body: Container(
            decoration: Styles().backgroundMain(),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                  Container(
                    height: 400,
                    width: screenSize.width - 30,
                    child: SnapList(
                      sizeProvider: (index, data) =>
                          Size(screenSize.width - 60, 380),
                      separatorProvider: (index, data) => Size(10.0, 10.0),
                      builder: (context, index, data) {
                        return cardTemplate(_cards[index]);
                      },
                      count: _cards.length,
                    ),
                  )
                ]))));
  }

  Card cardTemplate(CardBalance tarjeta) => Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(children: [
            Text('Bs. ${tarjeta.balance}',
                textAlign: TextAlign.center, style: Styles().titleOne()),
            SizedBox(height: 15.0),
            Text('UID: ${tarjeta.uid}',
                textAlign: TextAlign.center, style: Styles().titleTwo()),
            SizedBox(height: 10.0),
            Text('Tipo de Tarjeta: ${tarjeta.tipoTarjeta}',
                textAlign: TextAlign.center, style: Styles().textTwo()),
            SizedBox(height: 10.0),
            Text('${tarjeta.estado}',
                textAlign: TextAlign.center, style: Styles().titleTwo()),
            SizedBox(height: 10.0),
            Text('Ultimo pase realizado en ${tarjeta.ultimoPase}',
                textAlign: TextAlign.center, style: Styles().textTwo())
          ])));
}
