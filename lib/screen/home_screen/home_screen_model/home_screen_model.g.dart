// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModelBase, Store {
  late final _$isLoginAtom =
      Atom(name: '_HomeScreenModelBase.isLogin', context: context);

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

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

  late final _$gendersAtom =
      Atom(name: '_HomeScreenModelBase.genders', context: context);

  @override
  List<String> get genders {
    _$gendersAtom.reportRead();
    return super.genders;
  }

  @override
  set genders(List<String> value) {
    _$gendersAtom.reportWrite(value, super.genders, () {
      super.genders = value;
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

  late final _$signUpNameControllerAtom =
      Atom(name: '_HomeScreenModelBase.signUpNameController', context: context);

  @override
  TextEditingController get signUpNameController {
    _$signUpNameControllerAtom.reportRead();
    return super.signUpNameController;
  }

  @override
  set signUpNameController(TextEditingController value) {
    _$signUpNameControllerAtom.reportWrite(value, super.signUpNameController,
        () {
      super.signUpNameController = value;
    });
  }

  late final _$signUpYasControllerAtom =
      Atom(name: '_HomeScreenModelBase.signUpYasController', context: context);

  @override
  TextEditingController get signUpYasController {
    _$signUpYasControllerAtom.reportRead();
    return super.signUpYasController;
  }

  @override
  set signUpYasController(TextEditingController value) {
    _$signUpYasControllerAtom.reportWrite(value, super.signUpYasController, () {
      super.signUpYasController = value;
    });
  }

  late final _$signUpEmailControllerAtom = Atom(
      name: '_HomeScreenModelBase.signUpEmailController', context: context);

  @override
  TextEditingController get signUpEmailController {
    _$signUpEmailControllerAtom.reportRead();
    return super.signUpEmailController;
  }

  @override
  set signUpEmailController(TextEditingController value) {
    _$signUpEmailControllerAtom.reportWrite(value, super.signUpEmailController,
        () {
      super.signUpEmailController = value;
    });
  }

  late final _$signUpPasswordControllerAtom = Atom(
      name: '_HomeScreenModelBase.signUpPasswordController', context: context);

  @override
  TextEditingController get signUpPasswordController {
    _$signUpPasswordControllerAtom.reportRead();
    return super.signUpPasswordController;
  }

  @override
  set signUpPasswordController(TextEditingController value) {
    _$signUpPasswordControllerAtom
        .reportWrite(value, super.signUpPasswordController, () {
      super.signUpPasswordController = value;
    });
  }

  late final _$userDataAtom =
      Atom(name: '_HomeScreenModelBase.userData', context: context);

  @override
  GetUserService get userData {
    _$userDataAtom.reportRead();
    return super.userData;
  }

  @override
  set userData(GetUserService value) {
    _$userDataAtom.reportWrite(value, super.userData, () {
      super.userData = value;
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

  late final _$initializeAsyncAction =
      AsyncAction('_HomeScreenModelBase.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
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
      required String mail,
      required String password,
      required String age,
      required BuildContext context}) {
    return _$signUpOperateAsyncAction.run(() => super.signUpOperate(
        name: name,
        mail: mail,
        password: password,
        age: age,
        context: context));
  }

  late final _$_HomeScreenModelBaseActionController =
      ActionController(name: '_HomeScreenModelBase', context: context);

  @override
  void selectGender({required String value}) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.selectGender');
    try {
      return super.selectGender(value: value);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogin: ${isLogin},
searchController: ${searchController},
emailController: ${emailController},
passwordController: ${passwordController},
genders: ${genders},
selectedGender: ${selectedGender},
signUpNameController: ${signUpNameController},
signUpYasController: ${signUpYasController},
signUpEmailController: ${signUpEmailController},
signUpPasswordController: ${signUpPasswordController},
userData: ${userData},
data: ${data}
    ''';
  }
}
