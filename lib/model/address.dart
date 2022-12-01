import 'geo.dart'; //import chai tyo geo ko file access garna

class Address {
  final String street;
  final String suit;
  final String city;
  final String zipcode;
  final Geo geo; //geo class pahilaie banayera datatype Geo bhako

  Address({
    required this.street,
    required this.suit,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json[
          'street'], //inverted comma bhitra bhako chai uta api ko website sanga match hunu parcha
      suit: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }
}
