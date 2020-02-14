import 'package:flutter/cupertino.dart';

class User {
  String userId;
  String userName;
  String name;

  User({this.userId,@required this.userName,@required this.name});

  static fromJson(json) => User(
    userId: json['id'],
    userName: json['username'],
    name: json['name'],
  );
}