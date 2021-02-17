import 'package:meta/meta.dart';

class Token {
  Token({
    @required this.success,
    @required this.token,
    @required this.exp,
    @required this.iat,
  });

  final bool success;
  final String token;
  final int exp;
  final int iat;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        success: json["success"],
        exp: json["exp"],
        iat: json["iat"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "exp": exp,
        "iat": iat,
        "token": token,
      };
}
