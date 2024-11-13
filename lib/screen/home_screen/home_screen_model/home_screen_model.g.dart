// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModelBase, Store {
  late final _$searchControllerAtom =
      Atom(name: '_HomeScreenModelBase.searchController', context: context);

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$emailControllerAtom =
      Atom(name: '_HomeScreenModelBase.emailController', context: context);

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  late final _$passwordControllerAtom =
      Atom(name: '_HomeScreenModelBase.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$selectedGenderAtom =
      Atom(name: '_HomeScreenModelBase.selectedGender', context: context);

  @override
  String get selectedGender {
    _$selectedGenderAtom.reportRead();
    return super.selectedGender;
  }

  @override
  set selectedGender(String value) {
    _$selectedGenderAtom.reportWrite(value, super.selectedGender, () {
      super.selectedGender = value;
    });
  }

  late final _$dataAtom =
      Atom(name: '_HomeScreenModelBase.data', context: context);

  @override
  LoginServiceModel get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(LoginServiceModel value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$postLoginOperateAsyncAction =
      AsyncAction('_HomeScreenModelBase.postLoginOperate', context: context);

  @override
  Future<void> postLoginOperate(
      {required String email,
      required String password,
      required BuildContext context}) {
    return _$postLoginOperateAsyncAction.run(() => super
        .postLoginOperate(email: email, password: password, context: context));
  }

  late final _$signUpOperateAsyncAction =
      AsyncAction('_HomeScreenModelBase.signUpOperate', context: context);

  @override
  Future<void> signUpOperate(
      {required String name,
      required String plaka,
      required String mail,
      required String password,
      required String image,
      required String age,
      required BuildContext context}) {
    return _$signUpOperateAsyncAction.run(() => super.signUpOperate(
        name: name,
        plaka: plaka,
        mail: mail,
        password: password,
        image: image,
        age: age,
        context: context));
  }

  @override
  String toString() {
    return '''
searchController: ${searchController},
emailController: ${emailController},
passwordController: ${passwordController},
selectedGender: ${selectedGender},
data: ${data}
    ''';
  }
}
