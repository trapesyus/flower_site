import 'package:flower_site/core/extensions/navigate.extension.dart';
import 'package:flower_site/core/extensions/snackbar_extension.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/helper/shared_preferences_operate/shared_preferences_operate.dart';
import '../../../service/login_service/login_service.dart';
import '../../../service/login_service/login_service_model/login_service_model.dart';
import '../../../service/sign_up_service/sign_up_service.dart';
import '../home_screen.dart';
part 'home_screen_model.g.dart';

class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel;

abstract class _HomeScreenModelBase with Store {
  @observable
  TextEditingController searchController = TextEditingController();
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();
  @observable
  String selectedGender = 'Kadın';
  @observable
  LoginServiceModel data = LoginServiceModel(
      kind: '',
      localId: '',
      email: '',
      displayName: '',
      idToken: '',
      registered: false,
      refreshToken: '',
      expiresIn: '');

  @action
  Future<void> postLoginOperate(
      {required String email,
      required String password,
      required BuildContext context}) async {
    if (!email.contains('@') || password == '' || email == '') {
      context.snackBarExtension(
          content:
              'Email ya da Parola girme işlemi sırasında hatalı işlem yaptınız. Lütfen tekrar giriş yapmayı deneyin. ');
    } else {
      final LoginService loginService = LoginService();
      data = (await loginService.signInWithEmailPassword(email, password))!;
      if (data.kind == '' && context.mounted) {
        context.snackBarExtension(content: 'Kullanıcı adı ya da şifre yanlış');
        return;
      }

      await SharedPreferencesOperate.getLocalId(localId: data.localId);
      await HomeScreen().navigateEffectiveToPushReplacement(context: context);

      print('Giriş işlemi sonucu: ${data}');
    }
  }

  @action
  Future<void> signUpOperate(
      {required String name,
      required String plaka,
      required String mail,
      required String password,
      required String image,
      required String age,
      required BuildContext context}) async {
    if (name == '' ||
        mail == '' ||
        !mail.contains('@') ||
        password == '' ||
        age == '') {
      context.snackBarExtension(content: 'Lütfen bütüm bölümleri doldurun');
      return;
    }
    SignUpService authService = SignUpService();

    await authService.signUpWithEmailAndPassword(
        email: mail,
        password: password,
        context: context,
        adSoyad: name,
        image: image,
        gender: selectedGender,
        age: age,
        plaka: plaka);
  }
}
