import 'package:json_annotation/json_annotation.dart';

class UserModel {
  final String email;
  final String password;
  final String? fullName;

  UserModel({
    required this.email,
    required this.password,
    required this.fullName,
  });
}
