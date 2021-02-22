import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobiletelefericovirtual/app/data/models/token.dart';
import 'package:mobiletelefericovirtual/app/data/respositories/local/local_auth_repository.dart';
import 'package:mobiletelefericovirtual/app/data/respositories/remote/auth_repository.dart';
import 'package:mobiletelefericovirtual/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final AuthRepository _authenticationRepository = Get.find<AuthRepository>();
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  String _username = '', _password = '';

  void onUsernameChanged(String text) {
    _username = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<void> submit() async {
    Get.offNamed(AppRoutes.DASHBOARD);
    /*try {
      final Token authRequestToken = await _authenticationRepository.signIn(
        username: _username,
        password: _password,
      );
      await _localAuthRepository.setSession(authRequestToken);
      Get.offNamed(AppRoutes.DASHBOARD);
    } catch (e) {
      print(e);
      String message = "";
      if (e is DioError) {
        if (e.response != null) {
          message = e.response.statusMessage;
        } else {
          message = e.message;
        }
      }
      Get.dialog(
        AlertDialog(
          title: Text("ERROR"),
          content: Text(message),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      );
    }*/
  }
}
