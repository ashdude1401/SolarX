// To parse this JSON data, do
//
//     final seller = sellerFromJson(jsonString);

import 'dart:convert';

List<Seller> sellerFromJson(String str) =>
    List<Seller>.from(json.decode(str).map((x) => Seller.fromJson(x)));

String sellerToJson(List<Seller> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Seller {
  String id;
  String userId;
  String username;
  String email;
  String firstName;
  String lastName;
  String address;
  String city;
  int zipCode;
  String country;
  List<PhoneNumber> phoneNumber;
  List<String> solarPanels;
  List<dynamic> reviews;
  List<dynamic> orders;
  int v;
  String? companyName;

  Seller({
    required this.id,
    required this.userId,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.city,
    required this.zipCode,
    required this.country,
    required this.phoneNumber,
    required this.solarPanels,
    required this.reviews,
    required this.orders,
    required this.v,
    this.companyName,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["_id"],
        userId: json["userId"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        address: json["address"],
        city: json["city"],
        zipCode: json["zipCode"],
        country: json["country"],
        phoneNumber: List<PhoneNumber>.from(
            json["phoneNumber"].map((x) => PhoneNumber.fromJson(x))),
        solarPanels: List<String>.from(json["solarPanels"].map((x) => x)),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        v: json["__v"],
        companyName: json["companyName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "city": city,
        "zipCode": zipCode,
        "country": country,
        "phoneNumber": List<dynamic>.from(phoneNumber.map((x) => x.toJson())),
        "solarPanels": List<dynamic>.from(solarPanels.map((x) => x)),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "orders": List<dynamic>.from(orders.map((x) => x)),
        "__v": v,
        "companyName": companyName,
      };
}

class PhoneNumber {
  int countryCode;
  int number;
  String id;

  PhoneNumber({
    required this.countryCode,
    required this.number,
    required this.id,
  });

  factory PhoneNumber.fromJson(Map<String, dynamic> json) => PhoneNumber(
        countryCode: json["countryCode"],
        number: json["number"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "countryCode": countryCode,
        "number": number,
        "_id": id,
      };
}
