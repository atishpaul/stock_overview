// To parse this JSON data, do
//
//     final stockSearchModel = stockSearchModelFromJson(jsonString);

import 'dart:convert';

StockSearchModel stockSearchModelFromJson(String str) => StockSearchModel.fromJson(json.decode(str));

String stockSearchModelToJson(StockSearchModel data) => json.encode(data.toJson());

class StockSearchModel {
  StockSearchModel({
    this.refreshDetails,
    this.result,
    this.popularCat,
    this.tabs,
  });

  RefreshDetails? refreshDetails;
  List<Result>? result;
  PopularCat? popularCat;
  List<Tab>? tabs;

  factory StockSearchModel.fromJson(Map<String, dynamic> json) => StockSearchModel(
    refreshDetails: RefreshDetails.fromJson(json["refresh_details"]),
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    popularCat: PopularCat.fromJson(json["popular_cat"]),
    tabs: List<Tab>.from(json["tabs"].map((x) => Tab.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "refresh_details": refreshDetails!.toJson(),
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "popular_cat": popularCat!.toJson(),
    "tabs": List<dynamic>.from(tabs!.map((x) => x.toJson())),
  };
}

class PopularCat {
  PopularCat({
    this.attr,
    this.data,
  });

  Attr? attr;
  String? data;

  factory PopularCat.fromJson(Map<String, dynamic> json) => PopularCat(
    attr: Attr.fromJson(json["attr"]),
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "attr": attr!.toJson(),
    "data": data,
  };
}

class Attr {
  Attr({
    this.name,
  });

  String? name;

  factory Attr.fromJson(Map<String, dynamic> json) => Attr(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class RefreshDetails {
  RefreshDetails({
    this.flag,
  });

  String? flag;

  factory RefreshDetails.fromJson(Map<String, dynamic> json) => RefreshDetails(
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "flag": flag,
  };
}

class Result {
  Result({
    this.id,
    this.name,
    this.shortname,
    this.category,
    this.categoryId,
    this.topicId,
    this.bseid,
    this.nseid,
    this.isinid,
    this.fundFamily,
    this.fundClass,
    this.expiryDate,
    this.expiryDateD,
    this.instrument,
    this.ex,
    this.trackId,
    this.symbol,
    this.msgType,
    this.weight,
    this.did,
    this.fullnm,
    this.sector,
    this.sectorId,
    this.wwwUrl,
    this.optionType,
    this.strikePrice,
  });

  String? id;
  String? name;
  String? shortname;
  String? category;
  String? categoryId;
  String? topicId;
  String? bseid;
  String? nseid;
  String? isinid;
  String? fundFamily;
  String? fundClass;
  String? expiryDate;
  String? expiryDateD;
  String? instrument;
  String? ex;
  String? trackId;
  String? symbol;
  String? msgType;
  String? weight;
  String? did;
  String? fullnm;
  String? sector;
  String? sectorId;
  String? wwwUrl;
  String? optionType;
  String? strikePrice;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    shortname: json["shortname"],
    category: json["category"],
    categoryId: json["category_id"],
    topicId: json["topic_id"] == null ? null : json["topic_id"],
    bseid: json["bseid"],
    nseid: json["nseid"],
    isinid: json["isinid"],
    fundFamily: json["fund_family"],
    fundClass: json["fund_class"],
    expiryDate: json["expiry_date"],
    expiryDateD: json["expiry_date_d"],
    instrument: json["instrument"],
    ex: json["ex"],
    trackId: json["track_id"],
    symbol: json["symbol"],
    msgType: json["msg_type"],
    weight: json["weight"],
    did: json["did"] == null ? null : json["did"],
    fullnm: json["fullnm"] == null ? null : json["fullnm"],
    sector: json["sector"] == null ? null : json["sector"],
    sectorId: json["sector_id"] == null ? null : json["sector_id"],
    wwwUrl: json["www_url"],
    optionType: json["option_type"] == null ? null : json["option_type"],
    strikePrice: json["strike_price"] == null ? null : json["strike_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "shortname": shortname,
    "category": category,
    "category_id": categoryId,
    "topic_id": topicId == null ? null : topicId,
    "bseid": bseid,
    "nseid": nseid,
    "isinid": isinid,
    "fund_family": fundFamily,
    "fund_class": fundClass,
    "expiry_date": expiryDate,
    "expiry_date_d": expiryDateD,
    "instrument": instrument,
    "ex": ex,
    "track_id": trackId,
    "symbol": symbol,
    "msg_type": msgType,
    "weight": weight,
    "did": did == null ? null : did,
    "fullnm": fullnm == null ? null : fullnm,
    "sector": sector == null ? null : sector,
    "sector_id": sectorId == null ? null : sectorId,
    "www_url": wwwUrl,
    "option_type": optionType == null ? null : optionType,
    "strike_price": strikePrice == null ? null : strikePrice,
  };
}

class Tab {
  Tab({
    this.name,
    this.url,
    this.uniqueId,
  });

  String? name;
  String? url;
  String? uniqueId;

  factory Tab.fromJson(Map<String, dynamic> json) => Tab(
    name: json["name"],
    url: json["url"],
    uniqueId: json["uniqueId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "uniqueId": uniqueId,
  };
}
