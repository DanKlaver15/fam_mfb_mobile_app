import 'dart:core';

import 'package:app/models/childcare_centers/address.dart';
import 'package:app/models/childcare_centers/contact.dart';

class ChildcareCenter{
  late final String centerId;
  late final CenterAddress address;
  late final Contact contact;
  late final String licenseType;
  late final String name;
  late final int youngstarRating;

  ChildcareCenter({
    required this.centerId,
    required this.address,
    required this.contact,
    required this.licenseType,
    required this.name,
    required int youngstarRating
  });

  ChildcareCenter.fromJson(Map<String, dynamic> json) {
    centerId = json['_id'];
    address = json['address'];
    contact = json['contact'];
    licenseType = json['licenseType'];
    name = json['name'];
    youngstarRating = json['youngstarRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = centerId;
    data['address'] = address;
    data['contact'] = contact;
    data['licenseType'] = licenseType;
    data['name'] = name;
    data['youngstarRating'] = youngstarRating;
    return data;
  }
}
