class CardBalance {
  final String uid;
  final int profile;
  final String estado;
  final String balance;
  final String tipoTarjeta;
  final String ultimoPase;

  CardBalance(this.uid, this.profile, this.estado, this.balance,
      this.tipoTarjeta, this.ultimoPase);

  CardBalance.fromJson(Map<String, dynamic> json)
      : uid = json['card_uid'],
        profile = json['id_profile'],
        estado = json['estado'],
        balance = json['balance'],
        tipoTarjeta = json['tipo_tarjeta'],
        ultimoPase = json['utlimo_pase'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'profile': profile,
        'estado': estado,
        'balance': balance,
        'tipoTarjeta': tipoTarjeta,
        'ultimoPase': ultimoPase
      };
}
