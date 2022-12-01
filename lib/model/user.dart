import 'dart:developer';

import 'address.dart';

class User {
  final int id;
  final String name;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final String userName;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.userName,
  });
//geo class pahilaie banayera datatype Geo bhako

  factory User.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return User(
      id: json[
          'id'], //inverted comma bhitra bhako chai uta api ko website sanga match hunu parcha
      name: json['name'],
      userName: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
    );
  }
}
