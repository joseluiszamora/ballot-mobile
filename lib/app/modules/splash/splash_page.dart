import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiletelefericovirtual/app/modules/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (_) => Center(child: CircularProgressIndicator()));
  }
}
