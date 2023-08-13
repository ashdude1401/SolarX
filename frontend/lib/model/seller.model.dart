// To parse this JSON data, do
//
//     final seller = sellerFromJson(jsonString);

import 'dart:convert';

List<Seller> sellerFromJson(String str) =>
    List<Seller>.from(json.decode(str).map((x) => Seller.fromJson(x)));

String sellerToJson(List<Seller> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Seller {
  String? id;
  String? description;
  String? brand;
  String? model;
  int? wattage;
  double? weight;
  int? price;
  String? dimensions;
  String? availability;
  SellerClass? seller;
  int? v;
  String? image;
  int? efficiency;

  Seller({
    this.id,
    this.description,
    this.brand,
    this.model,
    this.wattage,
    this.weight,
    this.price,
    this.dimensions,
    this.availability,
    this.seller,
    this.v,
    this.image,
    this.efficiency,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["_id"],
        description: json["description"],
        brand: json["brand"],
        model: json["model"],
        wattage: json["wattage"],
        weight: json["weight"]?.toDouble(),
        price: json["price"],
        dimensions: json["dimensions"],
        availability: json["availability"],
        seller: json["seller"] == null
            ? null
            : SellerClass.fromJson(json["seller"]),
        v: json["__v"],
        image: json["image"],
        efficiency: json["efficiency"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "brand": brand,
        "model": model,
        "wattage": wattage,
        "weight": weight,
        "price": price,
        "dimensions": dimensions,
        "availability": availability,
        "seller": seller?.toJson(),
        "__v": v,
        "image": image,
        "efficiency": efficiency,
      };
}

class SellerClass {
  String? id;
  String? userId;
  String? username;
  String? email;
  String? companyName;
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  int? zipCode;
  String? country;
  List<PhoneNumber>? phoneNumber;
  List<String>? solarPanels;
  List<dynamic>? reviews;
  List<dynamic>? orders;
  int? v;

  SellerClass({
    this.id,
    this.userId,
    this.username,
    this.email,
    this.companyName,
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.zipCode,
    this.country,
    this.phoneNumber,
    this.solarPanels,
    this.reviews,
    this.orders,
    this.v,
  });

  factory SellerClass.fromJson(Map<String, dynamic> json) => SellerClass(
        id: json["_id"],
        userId: json["userId"],
        username: json["username"],
        email: json["email"],
        companyName: json["companyName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        address: json["address"],
        city: json["city"],
        zipCode: json["zipCode"],
        country: json["country"],
        phoneNumber: json["phoneNumber"] == null
            ? []
            : List<PhoneNumber>.from(
                json["phoneNumber"]!.map((x) => PhoneNumber.fromJson(x))),
        solarPanels: json["solarPanels"] == null
            ? []
            : List<String>.from(json["solarPanels"]!.map((x) => x)),
        reviews: json["reviews"] == null
            ? []
            : List<dynamic>.from(json["reviews"]!.map((x) => x)),
        orders: json["orders"] == null
            ? []
            : List<dynamic>.from(json["orders"]!.map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "username": username,
        "email": email,
        "companyName": companyName,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "city": city,
        "zipCode": zipCode,
        "country": country,
        "phoneNumber": phoneNumber == null
            ? []
            : List<dynamic>.from(phoneNumber!.map((x) => x.toJson())),
        "solarPanels": solarPanels == null
            ? []
            : List<dynamic>.from(solarPanels!.map((x) => x)),
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "orders":
            orders == null ? [] : List<dynamic>.from(orders!.map((x) => x)),
        "__v": v,
      };
}

class PhoneNumber {
  int? countryCode;
  int? number;
  String? id;

  PhoneNumber({
    this.countryCode,
    this.number,
    this.id,
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
