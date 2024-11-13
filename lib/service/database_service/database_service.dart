import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flower_site/core/extensions/navigate.extension.dart';
import 'package:flutter/cupertino.dart';

import '../../screen/home_screen/home_screen.dart';
import '../get_user_model/get_user_model.dart';

class DatabaseService {
  final Dio _dio = Dio();
  final String baseUrl =
      'https://motormeet-36f7c-default-rtdb.europe-west1.firebasedatabase.app/users';

  Future<void> postUserData(String localId, Map<String, dynamic> userData,
      BuildContext context) async {
    final String databaseUrl = '$baseUrl/$localId.json';

    try {
      log('buraya girdi');
      Response response = await _dio
          .put(
            databaseUrl,
            data: userData,
          )
          .whenComplete(() async => await HomeScreen()
              .navigateEffectiveToPushReplacement(context: context));
      print('Data posted successfully! Response: ${response.data}');
    } catch (e) {
      print('Error posting data to Realtime Database: $e');
    }
  }

  Future<List<HzZBF9UXBCTV30jCHe5PhrUGyRj2>?> getUserData(
      String localId) async {
    final String databaseUrl = '$baseUrl/$localId.json';

    Response response = await _dio.get(databaseUrl);
    if (response.statusCode == 200) {
      List<HzZBF9UXBCTV30jCHe5PhrUGyRj2> users = await fetchUsers();
      return users;
    }
    return null;
  }
}
