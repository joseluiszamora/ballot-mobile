import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiletelefericovirtual/app/data/models/user_register.dart';
import 'package:mobiletelefericovirtual/app/data/respositories/remote/users_respository.dart';
import 'package:mobiletelefericovirtual/app/utils/dialogs.dart';
import 'package:mobiletelefericovirtual/app/utils/parse_values.dart';
import 'package:progress_dialog/progress_dialog.dart';

class StepOneFormController extends GetxController {
  final UsersRepository _usersRepository = Get.find<UsersRepository>();

  bool _showFieldsExtranjero = false;

  bool get showFieldsExtranjero => _showFieldsExtranjero;

  setShowFieldsExtranjero(value) {
    _showFieldsExtranjero = value;
  }

  updateUserRegister(BuildContext context, Map<String, dynamic> values,
      UserRegister user) async {
    ProgressDialog dialog =
        CustomProgressDialog(context, 'Verificando Datos del usuario').normal();
    dialog.show();

    UserRegister newUser = new UserRegister(
        document: cleanString(values['document']),
        docType: doctype(values['nationality']),
        expedido: values['expedido'],
        name: cleanString(values['name']),
        lastName: cleanString(values['lastname']),
        phone: cleanString(values['phone']),
        email: user.email,
        address: user.address,
        photo: user.photo,
        token: user.token,
        sex: user.sex,
        birthDay: formatDate(values['birthdate']),
        nacionalityId: nationCode(values['nationality'], values['country']),
        profileId: 1);

    dialog.hide();

    _usersRepository.registerUser(user: newUser);
  }
}
