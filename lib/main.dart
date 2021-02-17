import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiletelefericovirtual/app/modules/splash/splash_binding.dart';
import 'package:mobiletelefericovirtual/app/modules/splash/splash_page.dart';
import 'package:mobiletelefericovirtual/app/routes/app_pages.dart';

import 'app/utils/dependency_injection.dart';

void main() {
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
