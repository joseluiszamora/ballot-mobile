import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiletelefericovirtual/app/data/models/card_balance.dart';
import 'package:mobiletelefericovirtual/app/data/respositories/remote/cards_repository.dart';
import 'package:mobiletelefericovirtual/app/routes/app_routes.dart';
import 'package:mobiletelefericovirtual/app/utils/dialogs.dart';
import 'package:mobiletelefericovirtual/app/utils/parse_values.dart';
import 'package:progress_dialog/progress_dialog.dart';

class DNIFormController extends GetxController {
  final CardsRepository _cardsRepository = Get.find<CardsRepository>();

  List<CardBalance> _cards = [];

  List<CardBalance> get cards => _cards;

  Future<void> getBalanceByDNI(
      Map<String, dynamic> values, BuildContext context) async {
    ProgressDialog dialog =
        CustomProgressDialog(context, 'Verificando Saldo').normal();
    await dialog.show();

    try {
      String dni = cleanString(values['documento']);

      var response = await _cardsRepository.getBalanceByDNI(dni: dni);
      dialog.hide();

      if (response.data["status"] == "success") {
        List<CardBalance> tarjetas = (response.data['result'] as List)
            .map((e) => CardBalance.fromJson(e))
            .toList();

        Get.toNamed(AppRoutes.CARD_VIEWER, arguments: tarjetas);
      } else {
        showDialogAlert(context, "error", response.data["message"], "Ok", () {
          Navigator.pop(context);
        }, () {
          Navigator.pop(context);
        });
      }
    } catch (e) {
      dialog.hide();
    }
  }

  getBalanceByUID() {}
}
