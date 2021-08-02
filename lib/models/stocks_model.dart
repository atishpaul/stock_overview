// To parse this JSON data, do
//
//     final stocksModel = stocksModelFromJson(jsonString);

import 'dart:convert';

StocksModel stocksModelFromJson(String str) => StocksModel.fromJson(json.decode(str));

String stocksModelToJson(StocksModel data) => json.encode(data.toJson());

class StocksModel {
  StocksModel({
    this.code,
    this.message,
    this.data,
  });

  String? code;
  String? message;
  Data? data;

  factory StocksModel.fromJson(Map<String, dynamic> json) => StocksModel(
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
    this.scrollAds,
    this.subscription,
  });

  String? heading;
  List<ListElement>? list;
  More? more;
  ScrollAds? scrollAds;
  Subscription? subscription;

  factory Datalist.fromJson(Map<String, dynamic> json) => Datalist(
    heading: json["heading"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    more: More.fromJson(json["more"]),
    scrollAds: json["scroll_ads"] == null ? null : ScrollAds.fromJson(json["scroll_ads"]),
    subscription: json["subscription"] == null ? null : Subscription.fromJson(json["subscription"]),
  );

  Map<String, dynamic> toJson() => {
    "heading": heading,
    "list": List<dynamic>.from(list!.map((x) => x.toJson())),
    "more": more!.toJson(),
    "scroll_ads": scrollAds == null ? null : scrollAds!.toJson(),
    "subscription": subscription == null ? null : subscription!.toJson(),
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
    this.lastupdate,
    this.vol,
    this.dateFormat,
    this.shareUrl,
    this.consumId,
    this.nseId,
  });

  String? id;
  Exchg? exchg;
  String? name;
  String? cp;
  String? chg;
  String? pchg;
  String? dir;
  String? lastupdate;
  String? vol;
  DateFormat? dateFormat;
  String? shareUrl;
  ConsumId? consumId;
  String? nseId;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    exchg: exchgValues.map[json["exchg"]],
    name: json["name"],
    cp: json["cp"],
    chg: json["chg"],
    pchg: json["pchg"],
    dir: json["dir"],
    lastupdate: json["lastupdate"],
    vol: json["vol"],
    dateFormat: dateFormatValues.map[json["date_format"]],
    shareUrl: json["share_url"],
    consumId: consumIdValues.map[json["consum_id"]],
    nseId: json["nse_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "exchg": exchgValues.reverse[exchg],
    "name": name,
    "cp": cp,
    "chg": chg,
    "pchg": pchg,
    "dir": dir,
    "lastupdate": lastupdate,
    "vol": vol,
    "date_format": dateFormatValues.reverse[dateFormat],
    "share_url": shareUrl,
    "consum_id": consumIdValues.reverse[consumId],
    "nse_id": nseId,
  };
}

enum ConsumId { STOCK }

final consumIdValues = EnumValues({
  "stock": ConsumId.STOCK
});

enum DateFormat { MMM_DD_HH_MM }

final dateFormatValues = EnumValues({
  "MMM dd, HH:mm": DateFormat.MMM_DD_HH_MM
});

enum Exchg { NSE }

final exchgValues = EnumValues({
  "NSE": Exchg.NSE
});

class More {
  More({
    this.uniqueId,
    this.name,
    this.url,
    this.tabid,
  });

  String? uniqueId;
  String? name;
  String? url;
  String? tabid;

  factory More.fromJson(Map<String, dynamic> json) => More(
    uniqueId: json["unique_id"],
    name: json["name"],
    url: json["url"],
    tabid: json["tabid"],
  );

  Map<String, dynamic> toJson() => {
    "unique_id": uniqueId,
    "name": name,
    "url": url,
    "tabid": tabid,
  };
}

class ScrollAds {
  ScrollAds({
    this.sectionId,
    this.position,
    this.height,
    this.width,
    this.siteId,
    this.adType,
    this.htmlContent,
  });

  String? sectionId;
  String? position;
  String? height;
  String? width;
  String? siteId;
  String? adType;
  String? htmlContent;

  factory ScrollAds.fromJson(Map<String, dynamic> json) => ScrollAds(
    sectionId: json["section_id"],
    position: json["position"],
    height: json["height"],
    width: json["width"],
    siteId: json["site_id"],
    adType: json["ad_type"],
    htmlContent: json["html_content"],
  );

  Map<String, dynamic> toJson() => {
    "section_id": sectionId,
    "position": position,
    "height": height,
    "width": width,
    "site_id": siteId,
    "ad_type": adType,
    "html_content": htmlContent,
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
