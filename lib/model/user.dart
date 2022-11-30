import 'address.dart';

class User {
  final int id;
  final String name;
  final String email;
  final Address address;
  final String phoneNumber;
  final String website;
  final String userName;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.website,
    required this.userName,
  });
//geo class pahilaie banayera datatype Geo bhako

   factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json[  'id'], //inverted comma bhitra bhako chai uta api ko website sanga match hunu parcha
      name: json['suit'],
      userName: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phoneNumber: json['phoneNumber'],
      website: json['website'],
    );

}}
