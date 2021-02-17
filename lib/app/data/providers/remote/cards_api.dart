import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
import 'package:mobiletelefericovirtual/app/utils/config.dart';

class CardsAPI {
  Dio _dio = Get.find<Dio>();

  CardsAPI() {
    _dio.options.baseUrl = Config.BASE_URL_CMI;
  }

  Future getBalanceByDNI({@required String dni}) async {
    final response =
        await _dio.get('/api/consultaSaldoCI', queryParameters: {"ci": dni});
    return response;
  }

  Future getBalanceByUID({@required String uid}) async {
    final response =
        await _dio.get('/api/consultaSaldoUID', queryParameters: {"uid": uid});
    return response;
  }
}
