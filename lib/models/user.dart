import 'dart:core';

import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late final String userId;

  @HiveField(1)
  late final String email;

  String password;

  @HiveField(2)
  int userType;

  @HiveField(3)
  bool isEmailVerifiedFlag;

  @HiveField(4)
  bool isActiveResearchFlag;

  @HiveField(5)
  String firstName;

  @HiveField(6)
  String lastName;

  DateTime dob;

  @HiveField(7)
  bool isOnboardedFlag;

  DateTime createdAt;

  DateTime created = DateTime.now();
  DateTime dateOfBirth = DateTime.now();

  User({
    required this.userId,
    required this.email,
    this.password = '',
    this.userType = 1,
    this.isEmailVerifiedFlag = false,
    this.isActiveResearchFlag = false,
    this.firstName = '',
    this.lastName = '',
    DateTime? dobDateTime,
    this.isOnboardedFlag = true,
    DateTime? creationDateTime,
  }) : createdAt = creationDateTime ?? DateTime.now(), dob = dobDateTime ?? DateTime.now();
}

