import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:mobiletelefericovirtual/app/data/providers/local/local_auth.dart';
import 'package:mobiletelefericovirtual/app/data/providers/remote/auth_api.dart';
import 'package:mobiletelefericovirtual/app/data/providers/remote/cards_api.dart';
import 'package:mobiletelefericovirtual/app/data/providers/remote/users_api.dart';
import 'package:mobiletelefericovirtual/app/data/respositories/local/local_auth_repository.dart';
import 'package:mobiletelefericovirtual/app/data/respositories/remote/auth_repository.dart';
import 'package:mobiletelefericovirtual/app/data/respositories/remote/cards_repository.dart';
import 'package:mobiletelefericovirtual/app/data/respositories/remote/users_respository.dart';

class DependencyInjection {
  static void init() {
    // Dio
    Get.put<Dio>(Dio());
    Get.put<FlutterSecureStorage>(FlutterSecureStorage());

    // local providers
    Get.put<LocalAuth>(LocalAuth());

    // remote providers
    Get.put<AuthAPI>(AuthAPI());
    Get.put<CardsAPI>(CardsAPI());
    Get.put<UsersAPI>(UsersAPI());

    // local repositories
    Get.put<LocalAuthRepository>(LocalAuthRepository());

    // remote repositories
    Get.put<AuthRepository>(AuthRepository());
    Get.put<CardsRepository>(CardsRepository());
    Get.put<UsersRepository>(UsersRepository());
  }
}
