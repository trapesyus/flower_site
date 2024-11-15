import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flower_site/core/helper/shared_preferences_operate/shared_preferences_operate.dart';

class GetUserService {
  String? adSoyad;
  String? createdAt;
  String? email;
  String? age;
  String? gender;
  String? idToken;
  String? localId;

  GetUserService({
    this.adSoyad,
    this.createdAt,
    this.email,
    this.age,
    this.gender,
    this.idToken,
    this.localId,
  });

  GetUserService.fromJson(Map<String, dynamic> json) {
    adSoyad = json['adSoyad'];
    gender = json['gender'];
    age = json['age'];
    createdAt = json['createdAt'];
    email = json['email'];
    idToken = json['idToken'];
    localId = json['LocalId'];
  }
  Future<GetUserService?> fetchUsers({required String localId}) async {
    log(localId);
    final response = await Dio().get(
        'https://app-exam-5cc5d-default-rtdb.europe-west1.firebasedatabase.app/users/$localId.json');

    if (response.statusCode == 200) {
      log('veriler ${response.data} +');
      GetUserService getUserModel = GetUserService.fromJson(response.data);

      // Kullanıcıları bir listeye dönüştür
      return getUserModel;
    }
  }
}
