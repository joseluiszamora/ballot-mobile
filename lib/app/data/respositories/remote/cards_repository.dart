import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
import 'package:mobiletelefericovirtual/app/data/providers/remote/cards_api.dart';

class CardsRepository {
  final CardsAPI _cardsAPI = Get.find<CardsAPI>();

  Future getBalanceByDNI({@required String dni}) =>
      _cardsAPI.getBalanceByDNI(dni: dni);

  Future getBalanceByUID({@required String uid}) =>
      _cardsAPI.getBalanceByUID(uid: uid);
}
