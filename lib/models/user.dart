import 'dart:core';

class User{
  late final String userId;
  late final String email;
  late String password;
  late int userType;
  late bool isEmailVerifiedFlag;
  late bool isActiveResearchFlag;
  late String firstName;
  late String lastName;
  late DateTime dob;
  late bool isOnboardedFlag;
  late DateTime createdAt;
  late DateTime created = DateTime.now();
  late DateTime? dateOfBirth = DateTime.now();

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
  })  : createdAt = creationDateTime ?? DateTime.now(),
        dob = dobDateTime ?? DateTime.now();

  User.fromJason(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    userType = json['userType'];
    isEmailVerifiedFlag = json['isEmailVerifiedFlag'];
    isActiveResearchFlag = json['isActiveResearchFlag'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    isOnboardedFlag = json['isOnboardedFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['email'] = email;
    data['userType'] = userType;
    data['isEmailVerifiedFlag'] = isEmailVerifiedFlag;
    data['isActiveResearchFlag'] = isActiveResearchFlag;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['isOnboardedFlag'] = isOnboardedFlag;
    return data;
  }
}
