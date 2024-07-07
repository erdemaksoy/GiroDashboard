import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/base_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends BaseModel {
  final String kullaniciAdi;
  final String sifre;

  LoginModel(this.kullaniciAdi, this.sifre);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  String myJson() => jsonEncode(toJson());
}
