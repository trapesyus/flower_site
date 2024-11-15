import 'dart:io';

import 'package:flower_site/core/constants/color_constants.dart';
import 'package:flower_site/core/constants/image_constants.dart';
import 'package:flower_site/core/extensions/navigate.extension.dart';
import 'package:flower_site/core/extensions/padding_extension.dart';
import 'package:flower_site/core/extensions/size_extension.dart';
import 'package:flower_site/core/widgets/appbar_widget.dart';
import 'package:flower_site/core/widgets/elevated_button_widget.dart';
import 'package:flower_site/core/widgets/icon_button_widget.dart';
import 'package:flower_site/core/widgets/label_text_widget.dart';
import 'package:flower_site/core/widgets/text_button_widget.dart';
import 'package:flower_site/core/widgets/text_widget.dart';
import 'package:flower_site/core/widgets/textfield_widget.dart';
import 'package:flower_site/core/widgets/title_text_widget.dart';
import 'package:flower_site/screen/home_screen/home_screen_model/home_screen_model.dart';
import 'package:flower_site/service/database_service/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:simple_icons/simple_icons.dart';

class HomeScreen extends StatelessWidget {
  final String tempImageUrl =
      'https://avatars.mds.yandex.net/i?id=aca5c379c3761c3b11f35386082988df15b73b12-4600463-images-thumbs&n=13';
  final String tempSubtitle =
      '"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."';
  HomeScreen({super.key}) {
    reaction((_) async => await _homeScreenModel.initialize(), (_) {});
  }
  final HomeScreenModel _homeScreenModel = HomeScreenModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (context) {
        return Scaffold(
          endDrawer: Drawer(
            backgroundColor: ColorConstants.accentTextColor.shade300,
            elevation: 0,
            width: context.getSizeWidth(size: 0.2),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    margin: EdgeInsets.only(
                        bottom: context.getSizeHeight(size: 0.01)),
                    child: Column(
                      children: [
                        CustomText(
                            text: _homeScreenModel.userData.adSoyad ?? '',
                            color: ColorConstants.defaultTextColor)
                      ],
                    )),
                ListTile(
                    title:
                        CustomLabelText(label: 'Hesap', isColorNotWhite: true),
                    trailing: const Icon(Icons.account_box_outlined,
                        color: ColorConstants.greenButtonColor),
                    onTap: () {}),
                ListTile(
                    title: CustomLabelText(
                        label: 'Siparişlerim', isColorNotWhite: true),
                    trailing: const Icon(Icons.production_quantity_limits,
                        color: ColorConstants.greenButtonColor),
                    onTap: () {}),
                ListTile(
                    title: CustomLabelText(
                        label: 'Çıkış Yap', isColorNotWhite: true),
                    trailing: const Icon(Icons.logout,
                        color: ColorConstants.greenButtonColor),
                    onTap: () async => await _homeScreenModel
                        .logOut()
                        .whenComplete(() async => context.mounted
                            ? await HomeScreen()
                                .navigateEffectiveToPushReplacement(
                                    context: context)
                            : null))
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          appBar: _appBar(context),
          body: ListView(
            physics: const ScrollPhysics(),
            children: [
              _firstSection(context),
              _categoriesAndProductsListView(
                  context: context,
                  listTitle: 'Kategoriler',
                  length: 15,
                  onTap: () {}),
              _infoSection(context),
              _categoriesAndProductsListView(
                      context: context,
                      listTitle: 'Son Eklenen Ürünler',
                      length: 10,
                      onTap: () {})
                  .getPaddingOnly(context: context, bottom: 0.04),
              _freeShippingSection(context),
            ],
          ),
        );
      }),
    );
  }

  Container _freeShippingSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.getSizeWidth(size: 0.08),
          vertical: defaultTargetPlatform == TargetPlatform.iOS ||
                  defaultTargetPlatform == TargetPlatform.android
              ? 0
              : context.getSizeHeight(size: 0.08)),
      padding: EdgeInsets.only(left: context.getSizeWidth(size: 0.08)),
      height: defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.android
          ? context.getSizeHeight(size: 0.4)
          : context.getSizeHeight(size: 0.8),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConstants.imageMiddle),
              filterQuality: FilterQuality.high,
              fit: BoxFit.fitWidth)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomLabelText(label: 'Deneme'),
          CustomText(
              text: 'Ücretsiz Teslimat', color: ColorConstants.whiteColor)
        ],
      ),
    );
  }

  Container _infoSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.getSizeWidth(size: 0.08),
          vertical: context.getSizeHeight(size: 0.08)),
      height: context.getSizeHeight(size: 0.4),
      color: ColorConstants.accentGreenColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTitleText(
                    title: 'Lorem Ipsum', color: ColorConstants.whiteColor)
                .getPaddingOnly(context: context, top: 0.04),
            CustomText(
                    text:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.' *
                            4,
                    color: ColorConstants.whiteColor)
                .getPaddingOnly(
                    context: context,
                    top: 0.08,
                    right: defaultTargetPlatform == TargetPlatform.iOS ||
                            defaultTargetPlatform == TargetPlatform.android
                        ? 0.02
                        : 0.04,
                    bottom: 0.02,
                    left: 0.04)
          ],
        ),
      ),
    );
  }

  Container _firstSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.getSizeHeight(size: 0.08)),
      color: ColorConstants.greenColor,
      height: context.getSizeHeight(size: 0.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          defaultTargetPlatform == TargetPlatform.iOS ||
                  defaultTargetPlatform == TargetPlatform.android
              ? CustomTitleText(
                  title: 'Çiçek Sepeti', color: ColorConstants.whiteColor)
              : const SizedBox(),
          CustomTextField(
            controller: _homeScreenModel.searchController,
            horizontalHeight: 0.02,
            verticalHeight: 0.02,
            sizeLeft: 0.02,
            sizeBottom: 0.02,
            sizeRight: 0.02,
            sizeTop: 0.04,
            isIcon: true,
            label: 'Çiçeklerimizden arayın..',
            labelStyle: true,
            isIconOnTap: () {
              print(_homeScreenModel.searchController.value.text);
            },
            isIconTap: true,
          ),
          CustomText(
              text: tempSubtitle,
              color: ColorConstants.accentTextColor.shade100),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomIconButton(
                  icon: const Icon(SimpleIcons.whatsapp,
                      color: ColorConstants.whiteButtonColor),
                  onPressed: () {}),
              CustomIconButton(
                  icon: const Icon(SimpleIcons.instagram,
                      color: ColorConstants.whiteButtonColor),
                  onPressed: () {}),
              CustomIconButton(
                  icon: const Icon(SimpleIcons.x,
                      color: ColorConstants.whiteButtonColor),
                  onPressed: () {}),
              CustomIconButton(
                  icon: const Icon(SimpleIcons.facebook,
                      color: ColorConstants.whiteButtonColor),
                  onPressed: () {})
            ],
          )
        ],
      ),
    );
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: Column(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage(ImageConstants.imageLogo),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high)),
                child: null),
          ),
        ],
      ),
      backgroundColor: ColorConstants.greenColor,
      centerTitle: true,
      title: defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.android
          ? null
          : 'Çiçek Sepeti',
      actions: [
        CustomTextButton(
            text: 'Ürünler',
            onPressed: () {},
            color: ColorConstants.whiteButtonColor),
        Observer(builder: (context) {
          return _homeScreenModel.isLogin
              ? const SizedBox()
              : CustomTextButton(
                  text: 'Giriş Yap',
                  onPressed: () async => await _loginSectionShowDialog(context),
                  color: ColorConstants.whiteButtonColor);
        }),
        _homeScreenModel.isLogin
            ? const SizedBox()
            : CustomTextButton(
                text: 'Kayıt Ol',
                onPressed: () async => await _signUpSectionShowDialog(context),
                color: ColorConstants.whiteButtonColor),
        _homeScreenModel.isLogin
            ? CustomIconButton(
                icon: const Icon(CupertinoIcons.shopping_cart,
                    color: ColorConstants.whiteButtonColor),
                onPressed: () {})
            : const SizedBox(),
        _homeScreenModel.isLogin
            ? Builder(builder: (context) {
                return CustomIconButton(
                    icon: const Icon(CupertinoIcons.profile_circled),
                    onPressed: () => Scaffold.of(context).openEndDrawer());
              })
            : const SizedBox()
      ],
    );
  }

  Future<dynamic> _signUpSectionShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Observer(builder: (context) {
        return AlertDialog(
          backgroundColor: ColorConstants.greenColor,
          title:
              _loginSignUpSectionTitleIcon(context: context, title: 'Kayıt Ol'),
          content: Container(
            height: context.getSizeHeight(size: 0.6),
            width: context.getSizeWidth(size: 0.6),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: _homeScreenModel.signUpNameController,
                    horizontalHeight: 0.02,
                    verticalHeight: 0.02,
                    sizeLeft: 0.02,
                    sizeRight: 0.02,
                    sizeTop: 0.02,
                    label: 'Ad Soyad',
                    labelStyle: true,
                  ),
                  CustomTextField(
                    controller: _homeScreenModel.signUpYasController,
                    horizontalHeight: 0.02,
                    verticalHeight: 0.02,
                    sizeLeft: 0.02,
                    sizeRight: 0.02,
                    label: 'Yaş',
                    labelStyle: true,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorConstants.smallTextColor, width: 1)),
                    width: context.getSizeWidth(size: 0.56),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      padding: EdgeInsets.only(
                          left: context.getSizeWidth(size: 0.02)),

                      icon: _homeScreenModel.selectedGender == 'Kadın'
                          ? const Icon(Icons.female)
                          : const Icon(Icons.male),
                      iconEnabledColor: ColorConstants.whiteButtonColor,

                      dropdownColor: ColorConstants.greenColor,
                      hint: CustomText(
                        text: "Cinsiyet Seçiniz",
                        color: ColorConstants.whiteColor,
                      ), // Varsayılan yazı
                      value: _homeScreenModel
                          .selectedGender, // Seçilen değeri burada takip ediyoruz
                      onChanged: (String? newValue) {
                        if (newValue != 'Cinsiyet Seçiniz') {
                          _homeScreenModel.selectGender(value: newValue!);
                        }
                      },
                      items: _homeScreenModel.genders.map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: CustomText(
                              text: gender, color: ColorConstants.whiteColor),
                        );
                      }).toList(),
                    ),
                  ),
                  CustomTextField(
                    controller: _homeScreenModel.signUpEmailController,
                    horizontalHeight: 0.02,
                    verticalHeight: 0.02,
                    sizeLeft: 0.02,
                    sizeTop: 0.02,
                    sizeRight: 0.02,
                    label: 'E-Mail',
                    labelStyle: true,
                  ),
                  CustomTextField(
                    controller: _homeScreenModel.signUpPasswordController,
                    horizontalHeight: 0.02,
                    verticalHeight: 0.02,
                    sizeLeft: 0.02,
                    sizeRight: 0.02,
                    sizeBottom: 0.08,
                    label: 'Şifre',
                    labelStyle: true,
                    passwordType: true,
                  ),
                  SizedBox(
                    width: defaultTargetPlatform == TargetPlatform.iOS ||
                            defaultTargetPlatform == TargetPlatform.android
                        ? context.getSizeWidth(size: 0.4)
                        : context.getSizeWidth(size: 0.1),
                    height: context.getSizeHeight(size: 0.05),
                    child: CustomElevatedButton(
                        buttonText: 'Kayıt Ol',
                        onPressed: () async => await _homeScreenModel
                            .signUpOperate(
                                name: _homeScreenModel
                                    .signUpNameController.value.text,
                                password:
                                    _homeScreenModel
                                        .signUpPasswordController.value.text,
                                mail:
                                    _homeScreenModel
                                        .signUpEmailController.value.text,
                                age: _homeScreenModel
                                    .signUpYasController.value.text,
                                context: context)),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<dynamic> _loginSectionShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Observer(builder: (context) {
        return AlertDialog(
          backgroundColor: ColorConstants.greenColor,
          title: _loginSignUpSectionTitleIcon(
              context: context, title: 'Giriş Yap'),
          content: Container(
            height: context.getSizeHeight(size: 0.6),
            width: context.getSizeWidth(size: 0.6),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: _homeScreenModel.emailController,
                    horizontalHeight: 0.02,
                    verticalHeight: 0.02,
                    sizeLeft: 0.02,
                    sizeBottom: 0.02,
                    sizeRight: 0.02,
                    sizeTop: 0.04,
                    label: 'E-Mail',
                    labelStyle: true,
                  ),
                  CustomTextField(
                    controller: _homeScreenModel.passwordController,
                    horizontalHeight: 0.02,
                    verticalHeight: 0.02,
                    sizeLeft: 0.02,
                    sizeBottom: 0.02,
                    sizeRight: 0.02,
                    label: 'Şifre',
                    labelStyle: true,
                    passwordType: true,
                  ),
                  SizedBox(
                    width: context.getSizeWidth(size: 0.1),
                    height: context.getSizeHeight(size: 0.05),
                    child: CustomElevatedButton(
                        buttonText: 'Giriş Yap',
                        onPressed: () async =>
                            _homeScreenModel.postLoginOperate(
                                email:
                                    _homeScreenModel.emailController.value.text,
                                password: _homeScreenModel
                                    .passwordController.value.text,
                                context: context)),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Row _loginSignUpSectionTitleIcon(
      {required BuildContext context, required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTitleText(title: title, color: ColorConstants.whiteColor),
        CustomIconButton(
            icon:
                const Icon(Icons.close, color: ColorConstants.whiteButtonColor),
            onPressed: () => Navigator.pop(context))
      ],
    );
  }

  Column _categoriesAndProductsListView(
      {required BuildContext context,
      required String listTitle,
      required int length,
      required Function() onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleText(
                title: listTitle, color: ColorConstants.defaultTextColor)
            .getPadding(context: context, sizeWidth: 0.08, sizeHeight: 0),
        Container(
          margin: EdgeInsets.only(
              left: context.getSizeWidth(size: 0.08),
              right: context.getSizeWidth(size: 0.08),
              bottom: defaultTargetPlatform == TargetPlatform.iOS ||
                      defaultTargetPlatform == TargetPlatform.android
                  ? 0
                  : context.getSizeHeight(size: 0.08),
              top: context.getSizeHeight(size: 0.04)),
          width: context.getSizeWidth(size: 1),
          height: context.getSizeHeight(size: 0.3),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SizedBox(
              width: defaultTargetPlatform == TargetPlatform.iOS ||
                      defaultTargetPlatform == TargetPlatform.android
                  ? context.getSizeWidth(size: 0.4)
                  : context.getSizeWidth(size: 0.2),
              child: Card(
                borderOnForeground: true,
                elevation: 0,
                margin: EdgeInsets.symmetric(
                    horizontal: context.getSizeWidth(size: 0.02)),
                child: ListTile(
                  onTap: onTap,
                  title: Image.network(
                    tempImageUrl,
                  ),
                  subtitle: CustomText(
                      text: 'Ürün Adı $index',
                      color: ColorConstants.defaultTextColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
