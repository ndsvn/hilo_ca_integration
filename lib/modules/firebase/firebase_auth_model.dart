import 'dart:convert';

FirebaseAuthModel firebaseAuthFromJson(String str) =>
    FirebaseAuthModel.fromJson(json.decode(str));

String firebaseAuthToJson(FirebaseAuthModel data) => json.encode(data.toJson());

class FirebaseAuthModel {
  FirebaseAuthModel({
    this.email = '',
    this.password = '',
  });
  
  setEmail(String email) {
    this.email = email;
  }

  String getEmail() {
    return email;
  }

  setPassword(String password) {
    this.password = password;
  }

  String getPassword() {
    return password;
  }

  String email;
  String password;

  factory FirebaseAuthModel.fromJson(Map<String, dynamic> json) =>
      FirebaseAuthModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
