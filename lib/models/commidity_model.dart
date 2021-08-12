// To parse this JSON data, do
//
//     final commodityModel = commodityModelFromJson(jsonString);

import 'dart:convert';

CommodityModel commodityModelFromJson(String str) => CommodityModel.fromJson(json.decode(str));

String commodityModelToJson(CommodityModel data) => json.encode(data.toJson());

class CommodityModel {
  CommodityModel({
    this.code,
    this.message,
    this.data,
  });

  String? code;
  String? message;
  Data? data;

  factory CommodityModel.fromJson(Map<String, dynamic> json) => CommodityModel(
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
    this.heading,
    this.list,
    this.more,
    this.subscription,
  });

  String? heading;
  List<ListElement>? list;
  More? more;
  Subscription? subscription;

  factory Datalist.fromJson(Map<String, dynamic> json) => Datalist(
    heading: json["heading"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    more: More.fromJson(json["more"]),
    subscription: Subscription.fromJson(json["subscription"]),
  );

  Map<String, dynamic> toJson() => {
    "heading": heading,
    "list": List<dynamic>.from(list!.map((x) => x.toJson())),
    "more": more!.toJson(),
    "subscription": subscription!.toJson(),
  };
}

class ListElement {
  ListElement({
    this.id,
    this.exchg,
    this.name,
    this.cp,
    this.chg,
    this.pchg,
    this.dir,
    this.expiryDate,
    this.lastupdate,
    this.vol,
    this.dateFormat,
    this.shareUrl,
    this.consumId,
  });

  String? id;
  String? exchg;
  String? name;
  String? cp;
  String? chg;
  String? pchg;
  String? dir;
  DateTime? expiryDate;
  String? lastupdate;
  String? vol;
  String? dateFormat;
  String? shareUrl;
  String? consumId;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    exchg: json["exchg"] == null ? null : json["exchg"],
    name: json["name"],
    cp: json["cp"],
    chg: json["chg"],
    pchg: json["pchg"],
    dir: json["dir"],
    expiryDate: json["expiry_date"] == null ? null : DateTime.parse(json["expiry_date"]),
    lastupdate: json["lastupdate"],
    vol: json["vol"],
    dateFormat: json["date_format"],
    shareUrl: json["share_url"],
    consumId: json["consum_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "exchg": exchg == null ? null : exchg,
    "name": name,
    "cp": cp,
    "chg": chg,
    "pchg": pchg,
    "dir": dir,
    "expiry_date": expiryDate == null ? null : "${expiryDate!.year.toString().padLeft(4, '0')}-${expiryDate!.month.toString().padLeft(2, '0')}-${expiryDate!.day.toString().padLeft(2, '0')}",
    "lastupdate": lastupdate,
    "vol": vol,
    "date_format": dateFormat,
    "share_url": shareUrl,
    "consum_id": consumId,
  };
}

class More {
  More({
    this.uniqueId,
    this.name,
    this.url,
  });

  String? uniqueId;
  String? name;
  String? url;

  factory More.fromJson(Map<String, dynamic> json) => More(
    uniqueId: json["unique_id"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "unique_id": uniqueId,
    "name": name,
    "url": url,
  };
}

class Subscription {
  Subscription({
    this.heading,
    this.desc,
    this.author,
    this.url,
    this.img,
  });

  String? heading;
  String? desc;
  String? author;
  String? url;
  String? img;

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
    heading: json["heading"],
    desc: json["desc"],
    author: json["author"],
    url: json["url"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "heading": heading,
    "desc": desc,
    "author": author,
    "url": url,
    "img": img,
  };
}
