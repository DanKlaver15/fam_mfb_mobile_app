import 'dart:core';

class Contact{
  late String email;
  late String firstName;
  late String lastName;
  late int phone;

  Contact({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone
  });

  Contact.fromJason(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    return data;
  }
}
