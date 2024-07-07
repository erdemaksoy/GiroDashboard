import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../../../core/base/base_model.dart';

part 'kullanici_listesi_model.g.dart';

@JsonSerializable()
class KullaniciListesiModel extends BaseModel {
  final int kullaniciNo;

  final String? kullaniciAdi;

  final String? kullaniciIsim;

  final int? rolId;

  KullaniciListesiModel(
      this.kullaniciNo, this.kullaniciAdi, this.kullaniciIsim, this.rolId);

  Map<String, dynamic> toJson() => _$KullaniciListesiModelToJson(this);

  factory KullaniciListesiModel.fromJson(Map<String, dynamic> json) =>
      _$KullaniciListesiModelFromJson(json);

  factory KullaniciListesiModel.real(String token) {
    Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
    // Accessing claims
    String? username = decodedToken[
        "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname"];
    int userNo = int.parse(decodedToken[
        "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"]);
    String user = decodedToken["name"];
    int rolId = int.parse(decodedToken[
        "http://schemas.microsoft.com/ws/2008/06/identity/claims/role"]);
    return KullaniciListesiModel(userNo, username, user, rolId);
  }
  @override
  String myJson() => jsonEncode(toJson());
}
