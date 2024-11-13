import 'package:dio/dio.dart';

class GetUserModel {
  Map<String, HzZBF9UXBCTV30jCHe5PhrUGyRj2>? users;

  GetUserModel({this.users});

  GetUserModel.fromJson(Map<String, dynamic> json) {
    users = {};
    json.forEach((key, value) {
      users![key] = HzZBF9UXBCTV30jCHe5PhrUGyRj2.fromJson(value);
    });
  }
}

class HzZBF9UXBCTV30jCHe5PhrUGyRj2 {
  String? adSoyad;
  String? createdAt;
  String? email;
  String? age;
  String? gender;
  String? image;
  double? latitude;
  double? longtitude;
  String? plaka;
  String? idToken;
  String? localId;

  HzZBF9UXBCTV30jCHe5PhrUGyRj2(
      {this.adSoyad,
      this.createdAt,
      this.email,
      this.latitude,
      this.longtitude,
      this.plaka,
      this.idToken,
      this.localId,
      this.image,
      this.age,
      this.gender});

  HzZBF9UXBCTV30jCHe5PhrUGyRj2.fromJson(Map<String, dynamic> json) {
    adSoyad = json['adSoyad'];
    gender = json['gender'];
    age = json['age'];
    createdAt = json['createdAt'];
    email = json['email'];
    latitude = json['latitude'];
    longtitude = json['longtitude'];
    plaka = json['plaka'];
    image = json['image'];
    idToken = json['idToken'];
    localId = json['LocalId'];
  }
}

Future<List<HzZBF9UXBCTV30jCHe5PhrUGyRj2>> fetchUsers() async {
  try {
    final response = await Dio().get(
      'https://motormeet-36f7c-default-rtdb.europe-west1.firebasedatabase.app/users.json',
    );

    if (response.statusCode == 200) {
      GetUserModel getUserModel = GetUserModel.fromJson(response.data);

      // Kullanıcıları bir listeye dönüştür
      List<HzZBF9UXBCTV30jCHe5PhrUGyRj2> userList =
          getUserModel.users!.values.toList();

      return userList;
    } else {
      print('Failed to load users');
      return [];
    }
  } catch (e) {
    print('Error: $e');
    return [];
  }
}
