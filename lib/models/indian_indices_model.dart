// To parse this JSON data, do
//
//     final indianIndicesModel = indianIndicesModelFromJson(jsonString);

import 'dart:convert';

IndianIndicesModel indianIndicesModelFromJson(String str) => IndianIndicesModel.fromJson(json.decode(str));

String indianIndicesModelToJson(IndianIndicesModel data) => json.encode(data.toJson());

class IndianIndicesModel {
  IndianIndicesModel({
    this.refreshDetails,
    this.list,
  });

  RefreshDetails? refreshDetails;
  ListClass? list;

  factory IndianIndicesModel.fromJson(Map<String, dynamic> json) => IndianIndicesModel(
    refreshDetails: RefreshDetails.fromJson(json["refresh_details"]),
    list: ListClass.fromJson(json["list"]),
  );

  Map<String, dynamic> toJson() => {
    "refresh_details": refreshDetails!.toJson(),
    "list": list!.toJson(),
  };
}

class ListClass {
  ListClass({
    this.indices,
  });

  List<Index>? indices;

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
    indices: List<Index>.from(json["indices"].map((x) => Index.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "indices": List<dynamic>.from(indices!.map((x) => x.toJson())),
  };
}

class Index {
  Index({
    this.stkexchg,
    this.lastprice,
    this.change,
    this.percentchange,
    this.direction,
    this.lastupdated,
    this.flag,
    this.linkFlag,
    this.indId,
    this.indSymbol,
    this.url,
    this.open,
    this.close,
    this.high,
    this.low,
    this.worldStr,
    this.exchange,
  });

  String? stkexchg;
  String? lastprice;
  String? change;
  String? percentchange;
  int? direction;
  Lastupdated? lastupdated;
  String? flag;
  int? linkFlag;
  int? indId;
  String? indSymbol;
  String? url;
  String? open;
  String? close;
  String? high;
  String? low;
  WorldStr? worldStr;
  Exchange? exchange;

  factory Index.fromJson(Map<String, dynamic> json) => Index(
    stkexchg: json["stkexchg"],
    lastprice: json["lastprice"],
    change: json["change"],
    percentchange: json["percentchange"],
    direction: json["direction"],
    lastupdated: lastupdatedValues.map![json["lastupdated"]],
    flag: json["flag"],
    linkFlag: json["link_flag"],
    indId: json["ind_id"] == null ? null : json["ind_id"],
    indSymbol: json["ind_symbol"],
    url: json["url"],
    open: json["open"],
    close: json["close"],
    high: json["high"],
    low: json["low"],
    worldStr: worldStrValues.map![json["world_str"]],
    exchange: exchangeValues.map![json["exchange"]],
  );

  Map<String, dynamic> toJson() => {
    "stkexchg": stkexchg,
    "lastprice": lastprice,
    "change": change,
    "percentchange": percentchange,
    "direction": direction,
    "lastupdated": lastupdatedValues.reverse![lastupdated],
    "flag": flag,
    "link_flag": linkFlag,
    "ind_id": indId == null ? null : indId,
    "ind_symbol": indSymbol,
    "url": url,
    "open": open,
    "close": close,
    "high": high,
    "low": low,
    "world_str": worldStrValues.reverse![worldStr],
    "exchange": exchangeValues.reverse![exchange],
  };
}

enum Exchange { B, N }

final exchangeValues = EnumValues({
  "B": Exchange.B,
  "N": Exchange.N
});

enum Lastupdated { JUL_201610, JUL_201609 }

final lastupdatedValues = EnumValues({
  "Jul 20, 16:09": Lastupdated.JUL_201609,
  "Jul 20, 16:10": Lastupdated.JUL_201610
});

enum WorldStr { INDIAN }

final worldStrValues = EnumValues({
  "Indian": WorldStr.INDIAN
});

class RefreshDetails {
  RefreshDetails({
    this.flag,
    this.rate,
  });

  String? flag;
  int? rate;

  factory RefreshDetails.fromJson(Map<String, dynamic> json) => RefreshDetails(
    flag: json["flag"],
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "flag": flag,
    "rate": rate,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
