// To parse this JSON data, do
//
//     final catalogResponse = catalogResponseFromJson(jsonString);

import 'dart:convert';

CatalogResponse catalogResponseFromJson(String str) => CatalogResponse.fromJson(json.decode(str));

String catalogResponseToJson(CatalogResponse data) => json.encode(data.toJson());

class CatalogResponse {
  CatalogResponse({
    this.data,
  });

  List<Datum> data;

  factory CatalogResponse.fromJson(Map<String, dynamic> json) => CatalogResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.name,
    this.id,
    this.description,
    this.price,
    this.image,
    this.selected,
  });

  String name;
  int id;
  String description;
  String price;
  String image;
  bool selected;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    id: json["id"],
    description: json["description"],
    price: json["price"],
    image: json["image"],
    selected: json["selected"]=false,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "description": description,
    "price": price,
    "image": image,
    "selected": selected,
  };
}
