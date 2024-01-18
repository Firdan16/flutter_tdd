import 'dart:convert';

import 'package:tdd_training/core/utils/typedef.dart';
import 'package:tdd_training/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.avatar,
    required super.name,
    required super.id,
    required super.createdAt,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(
          avatar: map['avatar'] as String,
          name: map['name'] as String,
          id: map['id'] as String,
          createdAt: map['createdAt'] as String,
        );

  DataMap toMap() => {
        'avatar': avatar,
        'name': name,
        'id': id,
        'createdAt': createdAt,
      };

  String toJson() => jsonEncode(toMap());
}
