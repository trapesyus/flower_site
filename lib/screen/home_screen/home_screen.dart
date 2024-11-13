import 'package:flower_site/core/constants/color_constants.dart';
import 'package:flower_site/core/constants/image_constants.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simple_icons/simple_icons.dart';

class HomeScreen extends StatelessWidget {
  final String tempImageUrl =
      'https://avatars.mds.yandex.net/i?id=aca5c379c3761c3b11f35386082988df15b73b12-4600463-images-thumbs&n=13';
  final String tempSubtitle =
      '"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."';
  HomeScreen({super.key});
  final HomeScreenModel _homeScreenModel = HomeScreenModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (context) {
        return Scaffold(
          appBar: CustomAppBar(
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
            title: 'Çiçek Sepeti',
            actions: [
              CustomTextButton(
                  text: 'Ürünler',
                  onPressed: () {},
                  color: ColorConstants.whiteButtonColor),
              CustomTextButton(
                  text: 'Giriş Yap',
                  onPressed: () async => await showDialog(
                        context: context,
                        builder: (context) => Observer(builder: (context) {
                          return AlertDialog(
                            backgroundColor: ColorConstants.greenColor,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTitleText(
                                    title: 'Giriş Yap',
                                    color: ColorConstants.whiteColor),
                                CustomIconButton(
                                    icon: const Icon(Icons.close,
                                        color: ColorConstants.whiteButtonColor),
                                    onPressed: () => Navigator.pop(context))
                              ],
                            ),
                            content: Container(
                              height: context.getSizeHeight(size: 0.6),
                              width: context.getSizeWidth(size: 0.6),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      controller:
                                          _homeScreenModel.emailController,
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
                                      controller:
                                          _homeScreenModel.passwordController,
                                      horizontalHeight: 0.02,
                                      verticalHeight: 0.02,
                                      sizeLeft: 0.02,
                                      sizeBottom: 0.02,
                                      sizeRight: 0.02,
                                      sizeTop: 0.04,
                                      label: 'Şifre',
                                      labelStyle: true,
                                      passwordType: true,
                                    ),
                                    CustomElevatedButton(
                                        buttonText: 'Giriş Yap',
                                        onPressed: () async =>
                                            _homeScreenModel.postLoginOperate(
                                                email: _homeScreenModel
                                                    .emailController.value.text,
                                                password: _homeScreenModel
                                                    .passwordController
                                                    .value
                                                    .text,
                                                context: context))
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                  color: ColorConstants.whiteButtonColor),
              CustomTextButton(
                  text: 'Kayıt Ol',
                  onPressed: () {},
                  color: ColorConstants.whiteButtonColor),
              CustomIconButton(
                  icon: const Icon(CupertinoIcons.shopping_cart,
                      color: ColorConstants.whiteButtonColor),
                  onPressed: () {}),
              CustomIconButton(
                  icon: const Icon(CupertinoIcons.profile_circled),
                  onPressed: () {})
            ],
          ),
          body: ListView(
            physics: const ScrollPhysics(),
            children: [
              Container(
                margin:
                    EdgeInsets.only(bottom: context.getSizeHeight(size: 0.08)),
                color: ColorConstants.greenColor,
                height: context.getSizeHeight(size: 0.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
              ),
              CustomTitleText(
                      title: 'Kategoriler', color: ColorConstants.blackColor)
                  .getPadding(context: context, sizeWidth: 0.08, sizeHeight: 0),
              Container(
                margin: EdgeInsets.only(
                    left: context.getSizeWidth(size: 0.08),
                    right: context.getSizeWidth(size: 0.08),
                    bottom: context.getSizeHeight(size: 0.08),
                    top: context.getSizeHeight(size: 0.04)),
                width: context.getSizeWidth(size: 1),
                height: context.getSizeHeight(size: 0.3),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                    width: context.getSizeWidth(size: 0.2),
                    child: Card(
                      borderOnForeground: true,
                      elevation: 5,
                      margin: EdgeInsets.symmetric(
                          horizontal: context.getSizeWidth(size: 0.02)),
                      child: ListTile(
                        title: Image.network(
                          tempImageUrl,
                        ),
                        subtitle: CustomText(
                            text: 'Ürün Adı $index',
                            color: ColorConstants.defaultTextColor),
                        // trailing: index > 2 && index % 4 == 0
                        //     ? CustomIconButton(
                        //         icon: const Icon(
                        //           CupertinoIcons.arrow_right,
                        //           color: ColorConstants.greenButtonColor,
                        //         ),
                        //         onPressed: () {})
                        //     : const SizedBox(),
                      ),
                    ),
                  ),
                ),
              ).getPaddingOnly(context: context, bottom: 0.04),
              Container(
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
                              title: 'Lorem Ipsum',
                              color: ColorConstants.whiteColor)
                          .getPaddingOnly(context: context, top: 0.04),
                      CustomText(
                              text:
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.' *
                                      4,
                              color: ColorConstants.whiteColor)
                          .getPaddingOnly(
                              context: context,
                              top: 0.08,
                              right: 0.04,
                              bottom: 0.02,
                              left: 0.04)
                    ],
                  ),
                ),
              ),
              CustomTitleText(
                      title: 'Son Eklenen Ürünler',
                      color: ColorConstants.defaultTextColor)
                  .getPadding(context: context, sizeWidth: 0.08, sizeHeight: 0),
              Container(
                margin: EdgeInsets.only(
                    left: context.getSizeWidth(size: 0.08),
                    right: context.getSizeWidth(size: 0.08),
                    bottom: context.getSizeHeight(size: 0.08),
                    top: context.getSizeHeight(size: 0.04)),
                width: context.getSizeWidth(size: 1),
                height: context.getSizeHeight(size: 0.3),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                    width: context.getSizeWidth(size: 0.2),
                    child: Card(
                      borderOnForeground: true,
                      elevation: 5,
                      margin: EdgeInsets.symmetric(
                          horizontal: context.getSizeWidth(size: 0.02)),
                      child: ListTile(
                        title: Image.network(
                          tempImageUrl,
                        ),
                        subtitle: CustomText(
                            text: 'Ürün Adı $index',
                            color: ColorConstants.defaultTextColor),
                        // trailing: index > 2 && index % 4 == 0
                        //     ? CustomIconButton(
                        //         icon: const Icon(
                        //           CupertinoIcons.arrow_right,
                        //           color: ColorConstants.greenButtonColor,
                        //         ),
                        //         onPressed: () {})
                        //     : const SizedBox(),
                      ),
                    ),
                  ),
                ),
              ).getPaddingOnly(context: context, bottom: 0.04),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: context.getSizeWidth(size: 0.08),
                    vertical: context.getSizeHeight(size: 0.08)),
                padding:
                    EdgeInsets.only(left: context.getSizeWidth(size: 0.08)),
                height: context.getSizeHeight(size: 0.8),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstants.imageMiddle),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomLabelText(label: 'Deneme'),
                    CustomText(
                        text: 'Ücretsiz Teslimat',
                        color: ColorConstants.whiteColor)
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
