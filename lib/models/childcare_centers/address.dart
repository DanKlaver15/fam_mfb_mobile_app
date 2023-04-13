import 'dart:core';

class CenterAddress{
  late String address1;
  late String address2;
  late String city;
  late String state;
  late String stateShort;
  late int zip;

  CenterAddress({
    required this.address1,
    this.address2 = '',
    required this.city,
    required this.state,
    required this.stateShort,
    required this.zip
  });

  CenterAddress.fromJson(Map<String, dynamic> json) {
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    stateShort = json['stateShort'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address1'] = address1;
    data['address2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['stateShort'] = stateShort;
    data['zip'] = zip;
    return data;
  }
}
