import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flower_site/service/login_service/login_service_model/login_service_model.dart';
import 'package:flower_site/core/constants/api_constants/firebase_project_api.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<LoginServiceModel?> signInWithEmailPassword(
      String email, String password) async {
    log('buraya Girdi $email\n $password');
    const String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${FirebaseProjectApiConstants.webApi}';

    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, ErrorInterceptorHandler handler) {
        if (e.response?.statusCode == 400) {
          log('400 hatası: Yanlış e-posta veya şifre.');
          handler.resolve(
            Response(
              requestOptions: e.requestOptions,
              statusCode: 400,
              data: LoginServiceModel(
                kind: '',
                localId: '',
                email: '',
                displayName: '',
                idToken: '',
                registered: false,
                refreshToken: '',
                expiresIn: '',
              ),
            ),
          );
        } else {
          handler.next(e); // Diğer hatalar için normal işleme devam et
        }
      },
    ));

    Response response = await _dio.post(url,
        data: {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
        options: Options());
    switch (response.statusCode) {
      case 200:
        final jsonBody = LoginServiceModel.fromJson(response.data);

        return jsonBody;
      case 400:
        log('400 hatası');
        return response.data;
    }

    print("Giriş başarılı: ${response.data}");
  }
}
