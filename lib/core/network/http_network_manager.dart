import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../constants/network_constant.dart';
import '../base/base_model.dart';
import '../model/response_model.dart';
mixin HttpNetworkNManager{

 

Future<ResponseModel> httpGet(
    String urlPath, String? token) async {
  final url = Uri.parse('${NetworkConstants.baseURL}/$urlPath');
  final headers = {
    'authorization': 'bearer $token',
    'content-type': 'application/json'
  };

  final response = await http.get(url, headers: headers);
  
 switch(response.statusCode) {
  case 200:
  case 201:
  case 204:
      return ResponseModel("İşlem Başarılı","Başarılı",true,response.body);
  case 400:
  case 401:
  case 403:
  case 404:
     return ResponseModel("İşlem Başarısız","Başarısız",false,null);
  case 500:
  case 501:
  case 505:
    return ResponseModel("İşlem Başarısız","Başarısız",false,null);
  default:
     return ResponseModel("İşlem Başarısız","Başarısız",false,null);
}
}
Future<ResponseModel> httpGetParametre(
    String urlPath, String? token,String parametre) async {
  final url = Uri.parse('${NetworkConstants.baseURL}/$urlPath?RaporKodu=$parametre');
  final headers = {
    'authorization': 'bearer $token',
    'content-type': 'application/json'
  };

  final response = await http.get(url, headers: headers);
  
 switch(response.statusCode) {
  case 200:
  case 201:
  case 204:
      return ResponseModel("İşlem Başarılı","Başarılı",true,response.body);
  case 400:
  case 401:
  case 403:
  case 404:
     return ResponseModel("İşlem Başarısız","Başarısız",false,null);
  case 500:
  case 501:
  case 505:
    return ResponseModel("İşlem Başarısız","Başarısız",false,null);
  default:
     return ResponseModel("İşlem Başarısız","Başarısız",false,null);
}
}
Future<ResponseModel> httpPost<T extends BaseModel>(
    T model, String urlPath, String? token) async {
  final url = Uri.parse('${NetworkConstants.baseURL}/$urlPath');
  final headers = {
    'authorization': 'bearer $token',
    'content-type': 'application/json'
  };

  final response =
      await http.post(url, headers: headers, body: model.myJson());

   
 switch(response.statusCode) {
  case 200:
  case 201:
  case 204:
      return ResponseModel("İşlem Başarılı","Başarılı",true,response.body);
  case 400:
  case 401:
  case 403:
  case 404:
     return ResponseModel("İşlem Başarısız","Başarısız",false,null);
  case 500:
  case 501:
  case 505:
    return ResponseModel("İşlem Başarısız","Başarısız",false,null);
  default:
     return ResponseModel("İşlem Başarısız","Başarısız",false,null);
}
}

Future<ResponseModel> httpPut<T extends BaseModel>(
    T model, String urlPath, String? token) async {
  final url = Uri.parse('${NetworkConstants.baseURL}/$urlPath');
  final headers = {
    'authorization': 'bearer $token',
    'content-type': 'application/json'
  };

  final response =
      await http.put(url, headers: headers, body: model.myJson());

  switch(response.statusCode) {
  case 200:
  case 201:
  case 204:
      return ResponseModel("İşlem Başarılı","Başarılı",true,response.body);
  case 400:
  case 401:
  case 403:
  case 404:
     return ResponseModel("İşlem Başarısız","Başarısız",false,null);
  case 500:
  case 501:
  case 505:
    return ResponseModel("İşlem Başarısız","Başarısız",false,null);
  default:
     return ResponseModel("İşlem Başarısız","Başarısız",false,null);
}
}

Future<ResponseModel> httpDelete<T extends BaseModel>(
    T model, String urlPath, String? token) async {
  final url = Uri.parse('${NetworkConstants.baseURL}/$urlPath');
  final headers = {
    'authorization': 'bearer $token',
    'content-type': 'application/json'
  };

  final response =
      await http.delete(url, headers: headers, body: model.myJson());
 switch(response.statusCode) {
  case 200:
  case 201:
  case 204:
      return ResponseModel("İşlem Başarılı","Başarılı",true,response.body);
  case 400:
  case 401:
  case 403:
  case 404:
     return ResponseModel("İşlem Başarısız","Başarısız",false,null);
  case 500:
  case 501:
  case 505:
    return ResponseModel("İşlem Başarısız","Başarısız",false,null);
  default:
     return ResponseModel("İşlem Başarısız","Başarısız",false,null);
}
}
}