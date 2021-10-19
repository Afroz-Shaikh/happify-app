import 'dart:convert';

class UserDataModel {
  UserDataModel({
    required this.email,
    required this.profileImageUrl,
    required this.userName,
  });

  final String email;
  final String profileImageUrl;
  final String userName;

  factory UserDataModel.fromJson(String str) =>
      UserDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromMap(Map<String, dynamic> json) => UserDataModel(
        email: json["email"],
        profileImageUrl: json["profile_image_url"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "profile_image_url": profileImageUrl,
        "user_name": userName,
      };
}
