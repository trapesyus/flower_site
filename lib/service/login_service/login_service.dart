import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flower_site/service/login_service/login_service_model/login_service_model.dart';
import 'package:flower_site/core/constants/api_constants/firebase_project_api.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<LoginServiceModel> signInWithEmailPassword(
      String email, String password) async {
    log('buraya Girdi $email\n $password');
    const String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${FirebaseProjectApiConstants.webApi}';

    Response response = await _dio.post(
      url,
      data: {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      },
    );

    print("Giriş başarılı: ${response.data}");
    // log(response.data);
    // log(response.statusCode.toString());
    // if (response.statusCode != 200) {
    //   return LoginServiceModel(
    //       kind: '',
    //       localId: '',
    //       email: '',
    //       displayName: '',
    //       idToken: '',
    //       registered: false,
    //       refreshToken: '',
    //       expiresIn: '36');
    // }
    final jsonBody = LoginServiceModel.fromJson(response.data);

    return jsonBody; // Yanıt verilerini döndür
  }
}
