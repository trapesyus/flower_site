class LoginServiceModel {
  final String kind;
  final String localId;
  final String email;
  final String displayName;
  final String idToken;
  final bool registered;
  final String refreshToken;
  final String expiresIn;

  LoginServiceModel({
    required this.kind,
    required this.localId,
    required this.email,
    required this.displayName,
    required this.idToken,
    required this.registered,
    required this.refreshToken,
    required this.expiresIn,
  });

  // JSON'dan model oluşturmak için kullanılan fabrika yöntemi
  factory LoginServiceModel.fromJson(Map<String, dynamic> json) {
    return LoginServiceModel(
      kind: json['kind'],
      localId: json['localId'],
      email: json['email'],
      displayName:
          json['displayName'] ?? '', // `displayName` isteğe bağlı olabilir
      idToken: json['idToken'],
      registered: json['registered'] ?? true,
      refreshToken: json['refreshToken'],
      expiresIn: json['expiresIn'],
    );
  }

  // Modeli JSON'a dönüştürmek için kullanılan yöntem
  Map<String, dynamic> toJson() {
    return {
      'kind': kind,
      'localId': localId,
      'email': email,
      'displayName': displayName,
      'idToken': idToken,
      'registered': registered,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
    };
  }
}
