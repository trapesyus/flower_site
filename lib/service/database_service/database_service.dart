import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flower_site/core/extensions/navigate.extension.dart';
import 'package:flutter/cupertino.dart';

import '../../screen/home_screen/home_screen.dart';
import '../get_user_service/get_user_service.dart';

class DatabaseService {
  final Dio _dio = Dio();
  final String baseUrl =
      'https://app-exam-5cc5d-default-rtdb.europe-west1.firebasedatabase.app/users';

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
}
