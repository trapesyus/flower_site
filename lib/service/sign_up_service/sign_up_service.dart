import 'package:dio/dio.dart';
import 'package:flower_site/core/extensions/snackbar_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../../core/constants/api_constants/firebase_project_api.dart';
import '../../core/helper/shared_preferences_operate/shared_preferences_operate.dart';
import '../database_service/database_service.dart';
import '../login_service/login_service_model/login_service_model.dart';

class SignUpService {
  final Dio _dio = Dio();
  final DatabaseService _databaseService = DatabaseService();
  final tempLatitude = 41.015137;
  final tempLongtitude = 28.979530;
  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String image,
      required String password,
      required BuildContext context,
      required String adSoyad,
      required String gender,
      required String age,
      required String plaka,
      double? latitude,
      double? longtitude}) async {
    const String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${FirebaseProjectApiConstants.webApi}';

    try {
      final response = await _dio.post(
        url,
        data: {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      );

      if (response.statusCode == 200) {
        final LoginServiceModel data =
            LoginServiceModel.fromJson(response.data);

        Map<String, dynamic> userData = {
          'adSoyad': adSoyad,
          'age': age,
          'gender': gender,
          'plaka': plaka,
          'image': image,
          'latitude': latitude ?? tempLatitude,
          'longtitude': longtitude ?? tempLongtitude,
          'idToken': data.idToken,
          'email': data.email,
          'localId': data.localId,
          'createdAt': DateTime.now().toIso8601String(),
        };
        await SharedPreferencesOperate.getLocalId(localId: data.localId);
        if (context.mounted) {
          await _databaseService.postUserData(data.localId, userData, context);
        }

        if (context.mounted) {
          context.snackBarExtension(content: 'Kullanıcı başarıyla kaydedildi');
        }
        print('Kullanıcı başarıyla kaydedildi: ${response.data}');
      } else {
        print('Kayıt işlemi başarısız: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Hata: ${e.response?.data}');
      } else {
        print('İstek hatası: $e');
      }
    }
  }
}
