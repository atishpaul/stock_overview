// To parse this JSON data, do
//
//     final globalIndicesModel = globalIndicesModelFromJson(jsonString);

import 'dart:convert';

GlobalIndicesModel globalIndicesModelFromJson(String str) => GlobalIndicesModel.fromJson(json.decode(str));

String globalIndicesModelToJson(GlobalIndicesModel data) => json.encode(data.toJson());

class GlobalIndicesModel {
  GlobalIndicesModel({
    this.code,
    this.message,
    this.data,
  });

  String? code;
  String? message;
  Data? data;

  factory GlobalIndicesModel.fromJson(Map<String, dynamic> json) => GlobalIndicesModel(
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
  });

  String? heading;
  List<ListElement>? list;

  factory Datalist.fromJson(Map<String, dynamic> json) => Datalist(
    heading: json["heading"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "heading": heading,
    "list": List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    this.id,
    this.symbol,
    this.name,
    this.cp,
    this.chg,
    this.pchg,
    this.dir,
    this.lastupdate,
    this.dateFormat,
    this.flag,
    this.linkFlag,
    this.consumId,
    this.message,
  });

  String? id;
  String? symbol;
  String? name;
  String? cp;
  String? chg;
  String? pchg;
  String? dir;
  String? lastupdate;
  String? dateFormat;
  String? flag;
  int? linkFlag;
  String? consumId;
  String? message;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    symbol: json["symbol"],
    name: json["name"],
    cp: json["cp"],
    chg: json["chg"],
    pchg: json["pchg"],
    dir: json["dir"],
    lastupdate: json["lastupdate"],
    dateFormat: json["date_format"],
    flag: json["flag"],
    linkFlag: json["link_flag"],
    consumId: json["consum_id"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "symbol": symbol,
    "name": name,
    "cp": cp,
    "chg": chg,
    "pchg": pchg,
    "dir": dir,
    "lastupdate": lastupdate,
    "date_format": dateFormat,
    "flag": flag,
    "link_flag": linkFlag,
    "consum_id": consumId,
    "message": message,
  };
}
