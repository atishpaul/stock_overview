// To parse this JSON data, do
//
//     final latestNewsModel = latestNewsModelFromJson(jsonString);

import 'dart:convert';

LatestNewsModel latestNewsModelFromJson(String str) => LatestNewsModel.fromJson(json.decode(str));

String latestNewsModelToJson(LatestNewsModel data) => json.encode(data.toJson());

class LatestNewsModel {
  LatestNewsModel({
    this.code,
    this.message,
    this.data,
  });

  String? code;
  String? message;
  Data? data;

  factory LatestNewsModel.fromJson(Map<String, dynamic> json) => LatestNewsModel(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.sectionId,
    this.datalist,
  });

  String? sectionId;
  List<Datalist>? datalist;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    sectionId: json["section_id"],
    datalist: List<Datalist>.from(json["datalist"].map((x) => Datalist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "section_id": sectionId,
    "datalist": List<dynamic>.from(datalist!.map((x) => x.toJson())),
  };
}

class Datalist {
  Datalist({
    this.id,
    this.heading,
    this.type,
    this.dispDate,
    this.shareUrl,
    this.img,
    this.consumId,
    this.isPremium,
    this.source,
  });

  String? id;
  String? heading;
  String? type;
  String? dispDate;
  String? shareUrl;
  String? img;
  String? consumId;
  int? isPremium;
  String? source;

  factory Datalist.fromJson(Map<String, dynamic> json) => Datalist(
    id: json["id"],
    heading: json["heading"],
    type: json["type"],
    dispDate: json["disp_date"],
    shareUrl: json["share_url"],
    img: json["img"],
    consumId: json["consum_id"],
    isPremium: json["is_premium"],
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "heading": heading,
    "type": type,
    "disp_date": dispDate,
    "share_url": shareUrl,
    "img": img,
    "consum_id": consumId,
    "is_premium": isPremium,
    "source": source,
  };
}
