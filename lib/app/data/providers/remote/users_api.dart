import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobiletelefericovirtual/app/data/models/user_register.dart';
import 'package:mobiletelefericovirtual/app/utils/config.dart';

class UsersAPI {
  Dio _dio = Get.find<Dio>();

  UsersAPI() {
    _dio.options.baseUrl = Config.BASE_URL;
  }

  Future registerUser(UserRegister user) async {
    dynamic payload = {
      "document": user.document,
      "expedido": user.expedido,
      "docType": user.docType,
      "name": user.name,
      "lastName": user.lastName,
      "birthDay": user.birthDay,
      "phone": user.phone,
      "email": user.email,
      "sex": user.sex,
      "address": user.address,
      "nacionalityId": 2,
      "profileId": 1,
      "token_firebase": user.token
    };
    return await _dio.post('/appmovil/registro', data: payload);
  }
}
