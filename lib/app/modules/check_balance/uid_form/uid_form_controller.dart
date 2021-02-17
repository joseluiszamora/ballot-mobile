import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobiletelefericovirtual/app/data/models/card_balance.dart';
import 'package:mobiletelefericovirtual/app/data/respositories/remote/cards_repository.dart';
import 'package:mobiletelefericovirtual/app/routes/app_routes.dart';
import 'package:mobiletelefericovirtual/app/utils/dialogs.dart';
import 'package:progress_dialog/progress_dialog.dart';

class UIDFormController extends GetxController {
  final CardsRepository _cardsRepository = Get.find<CardsRepository>();

  getBalanceByUID(Map<String, dynamic> values, BuildContext context) async {
    ProgressDialog dialog =
        CustomProgressDialog(context, 'Verificando Saldo').normal();
    dialog.show();

    try {
      String uid = values["uid"];

      var response = await _cardsRepository.getBalanceByUID(uid: uid);
      dialog.hide();

      if (response.data["status"] == "success") {
        List<CardBalance> cards = (response.data['result'] as List)
            .map((e) => CardBalance.fromJson(e))
            .toList();
        Get.toNamed(AppRoutes.CARD_VIEWER);
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
}
