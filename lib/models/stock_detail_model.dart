// To parse this JSON data, do
//
//     final stockDetailModel = stockDetailModelFromJson(jsonString);

import 'dart:convert';

StockDetailModel stockDetailModelFromJson(String str) => StockDetailModel.fromJson(json.decode(str));

String stockDetailModelToJson(StockDetailModel data) => json.encode(data.toJson());

class StockDetailModel {
  StockDetailModel({
    this.code,
    this.message,
    this.data,
  });

  String? code;
  String? message;
  Data? data;

  factory StockDetailModel.fromJson(Map<String, dynamic> json) => StockDetailModel(
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
    this.refreshData,
    this.priceinfo,
    this.statistics,
    this.indicators,
    this.alerts,
    this.returns,
    this.scriptInfo,
    this.expiryepoch,
    this.swotdata,
    this.tabs,
    this.graphTab,
  });

  RefreshData? refreshData;
  Priceinfo? priceinfo;
  Statistics? statistics;
  String? indicators;
  List<Alert>? alerts;
  Returns? returns;
  ScriptInfo? scriptInfo;
  List<Expiryepoch>? expiryepoch;
  Swotdata? swotdata;
  List<Tab>? tabs;
  GraphTab? graphTab;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    refreshData: RefreshData.fromJson(json["refresh_data"]),
    priceinfo: Priceinfo.fromJson(json["priceinfo"]),
    statistics: Statistics.fromJson(json["statistics"]),
    indicators: json["indicators"],
    alerts: List<Alert>.from(json["alerts"].map((x) => Alert.fromJson(x))),
    returns: Returns.fromJson(json["returns"]),
    scriptInfo: ScriptInfo.fromJson(json["script_info"]),
    expiryepoch: List<Expiryepoch>.from(json["expiryepoch"].map((x) => Expiryepoch.fromJson(x))),
    swotdata: Swotdata.fromJson(json["swotdata"]),
    tabs: List<Tab>.from(json["tabs"].map((x) => Tab.fromJson(x))),
    graphTab: GraphTab.fromJson(json["graph_tab"]),
  );

  Map<String, dynamic> toJson() => {
    "refresh_data": refreshData!.toJson(),
    "priceinfo": priceinfo!.toJson(),
    "statistics": statistics!.toJson(),
    "indicators": indicators,
    "alerts": List<dynamic>.from(alerts!.map((x) => x.toJson())),
    "returns": returns!.toJson(),
    "script_info": scriptInfo!.toJson(),
    "expiryepoch": List<dynamic>.from(expiryepoch!.map((x) => x.toJson())),
    "swotdata": swotdata!.toJson(),
    "tabs": List<dynamic>.from(tabs!.map((x) => x.toJson())),
    "graph_tab": graphTab!.toJson(),
  };
}

class Alert {
  Alert({
    this.title,
    this.entdate,
    this.message,
    this.autono,
  });

  String? title;
  String? entdate;
  String? message;
  String? autono;

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
    title: json["title"],
    entdate: json["entdate"],
    message: json["message"],
    autono: json["autono"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "entdate": entdate,
    "message": message,
    "autono": autono,
  };
}

class Expiryepoch {
  Expiryepoch({
    this.epochtime,
    this.expirydate,
  });

  String? epochtime;
  DateTime? expirydate;

  factory Expiryepoch.fromJson(Map<String, dynamic> json) => Expiryepoch(
    epochtime: json["epochtime"],
    expirydate: DateTime.parse(json["expirydate"]),
  );

  Map<String, dynamic> toJson() => {
    "epochtime": epochtime,
    "expirydate": "${expirydate!.year.toString().padLeft(4, '0')}-${expirydate!.month.toString().padLeft(2, '0')}-${expirydate!.day.toString().padLeft(2, '0')}",
  };
}

class GraphTab {
  GraphTab({
    this.url,
    this.movingAvgUrl,
  });

  String? url;
  String? movingAvgUrl;

  factory GraphTab.fromJson(Map<String, dynamic> json) => GraphTab(
    url: json["url"],
    movingAvgUrl: json["moving_avg_url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "moving_avg_url": movingAvgUrl,
  };
}

class Priceinfo {
  Priceinfo({
    this.id,
    this.shortname,
    this.lastvalue,
    this.direction,
    this.chg,
    this.percentchange,
    this.volume,
    this.lastupdate,
    this.bidprice,
    this.bidqty,
    this.offerprice,
    this.offerqty,
    this.yesterdaysclose,
    this.todaysopen,
    this.vwap,
    this.dayhigh,
    this.daylow,
    this.yearlyhigh,
    this.yearlylow,
    this.lcprice,
    this.ucprice,
    this.shareUrl,
  });

  String? id;
  String? shortname;
  String? lastvalue;
  String? direction;
  String? chg;
  String? percentchange;
  String? volume;
  String? lastupdate;
  String? bidprice;
  String? bidqty;
  String? offerprice;
  String? offerqty;
  String? yesterdaysclose;
  String? todaysopen;
  String? vwap;
  String? dayhigh;
  String? daylow;
  String? yearlyhigh;
  String? yearlylow;
  String? lcprice;
  String? ucprice;
  String? shareUrl;

  factory Priceinfo.fromJson(Map<String, dynamic> json) => Priceinfo(
    id: json["id"],
    shortname: json["shortname"],
    lastvalue: json["lastvalue"],
    direction: json["direction"],
    chg: json["CHG"],
    percentchange: json["percentchange"],
    volume: json["volume"],
    lastupdate: json["lastupdate"],
    bidprice: json["bidprice"],
    bidqty: json["bidqty"],
    offerprice: json["offerprice"],
    offerqty: json["offerqty"],
    yesterdaysclose: json["yesterdaysclose"],
    todaysopen: json["todaysopen"],
    vwap: json["vwap"],
    dayhigh: json["dayhigh"],
    daylow: json["daylow"],
    yearlyhigh: json["yearlyhigh"],
    yearlylow: json["yearlylow"],
    lcprice: json["lcprice"],
    ucprice: json["ucprice"],
    shareUrl: json["share_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shortname": shortname,
    "lastvalue": lastvalue,
    "direction": direction,
    "CHG": chg,
    "percentchange": percentchange,
    "volume": volume,
    "lastupdate": lastupdate,
    "bidprice": bidprice,
    "bidqty": bidqty,
    "offerprice": offerprice,
    "offerqty": offerqty,
    "yesterdaysclose": yesterdaysclose,
    "todaysopen": todaysopen,
    "vwap": vwap,
    "dayhigh": dayhigh,
    "daylow": daylow,
    "yearlyhigh": yearlyhigh,
    "yearlylow": yearlylow,
    "lcprice": lcprice,
    "ucprice": ucprice,
    "share_url": shareUrl,
  };
}

class RefreshData {
  RefreshData({
    this.flag,
    this.rate,
  });

  String? flag;
  String? rate;

  factory RefreshData.fromJson(Map<String, dynamic> json) => RefreshData(
    flag: json["flag"],
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "flag": flag,
    "rate": rate,
  };
}

class Returns {
  Returns({
    this.ytd,
    this.the1Week,
    this.the1Month,
    this.the3Month,
    this.the6Month,
    this.the1Year,
    this.the2Year,
    this.the3Year,
  });

  String? ytd;
  String? the1Week;
  String? the1Month;
  String? the3Month;
  String? the6Month;
  String? the1Year;
  String? the2Year;
  String? the3Year;

  factory Returns.fromJson(Map<String, dynamic> json) => Returns(
    ytd: json["ytd"],
    the1Week: json["1week"],
    the1Month: json["1month"],
    the3Month: json["3month"],
    the6Month: json["6month"],
    the1Year: json["1year"],
    the2Year: json["2year"],
    the3Year: json["3year"],
  );

  Map<String, dynamic> toJson() => {
    "ytd": ytd,
    "1week": the1Week,
    "1month": the1Month,
    "3month": the3Month,
    "6month": the6Month,
    "1year": the1Year,
    "2year": the2Year,
    "3year": the3Year,
  };
}

class ScriptInfo {
  ScriptInfo({
    this.bseid,
    this.nseid,
    this.isinid,
    this.sector,
    this.topicid,
  });

  String? bseid;
  String? nseid;
  String? isinid;
  String? sector;
  String? topicid;

  factory ScriptInfo.fromJson(Map<String, dynamic> json) => ScriptInfo(
    bseid: json["bseid"],
    nseid: json["nseid"],
    isinid: json["isinid"],
    sector: json["sector"],
    topicid: json["topicid"],
  );

  Map<String, dynamic> toJson() => {
    "bseid": bseid,
    "nseid": nseid,
    "isinid": isinid,
    "sector": sector,
    "topicid": topicid,
  };
}

class Statistics {
  Statistics({
    this.mktcap,
    this.dividend,
    this.divYield,
    this.faceValue,
    this.marketLot,
    this.deliverables,
    this.indPe,
    this.epsTtm,
    this.pc,
    this.pe,
    this.pb,
    this.bv,
    this.deliverableSc,
    this.footerText,
  });

  String? mktcap;
  String? dividend;
  String? divYield;
  String? faceValue;
  String? marketLot;
  String? deliverables;
  String? indPe;
  Bv? epsTtm;
  Bv? pc;
  Bv? pe;
  Bv? pb;
  Bv? bv;
  Bv? deliverableSc;
  String? footerText;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    mktcap: json["mktcap"],
    dividend: json["dividend"],
    divYield: json["div_yield"],
    faceValue: json["face_value"],
    marketLot: json["market_lot"],
    deliverables: json["deliverables"],
    indPe: json["ind_pe"],
    epsTtm: Bv.fromJson(json["eps_ttm"]),
    pc: Bv.fromJson(json["pc"]),
    pe: Bv.fromJson(json["pe"]),
    pb: Bv.fromJson(json["pb"]),
    bv: Bv.fromJson(json["bv"]),
    deliverableSc: Bv.fromJson(json["deliverable_sc"]),
    footerText: json["footer_text"],
  );

  Map<String, dynamic> toJson() => {
    "mktcap": mktcap,
    "dividend": dividend,
    "div_yield": divYield,
    "face_value": faceValue,
    "market_lot": marketLot,
    "deliverables": deliverables,
    "ind_pe": indPe,
    "eps_ttm": epsTtm!.toJson(),
    "pc": pc!.toJson(),
    "pe": pe!.toJson(),
    "pb": pb!.toJson(),
    "bv": bv!.toJson(),
    "deliverable_sc": deliverableSc!.toJson(),
    "footer_text": footerText,
  };
}

class Bv {
  Bv({
    this.standalone,
    this.consolidated,
  });

  String? standalone;
  String? consolidated;

  factory Bv.fromJson(Map<String, dynamic> json) => Bv(
    standalone: json["standalone"],
    consolidated: json["consolidated"],
  );

  Map<String, dynamic> toJson() => {
    "standalone": standalone,
    "consolidated": consolidated,
  };
}

class Swotdata {
  Swotdata({
    this.strengths,
    this.threats,
    this.opportunities,
    this.weaknesses,
  });

  Opportunities? strengths;
  Opportunities? threats;
  Opportunities? opportunities;
  Opportunities? weaknesses;

  factory Swotdata.fromJson(Map<String, dynamic> json) => Swotdata(
    strengths: Opportunities.fromJson(json["strengths"]),
    threats: Opportunities.fromJson(json["threats"]),
    opportunities: Opportunities.fromJson(json["opportunities"]),
    weaknesses: Opportunities.fromJson(json["weaknesses"]),
  );

  Map<String, dynamic> toJson() => {
    "strengths": strengths!.toJson(),
    "threats": threats!.toJson(),
    "opportunities": opportunities!.toJson(),
    "weaknesses": weaknesses!.toJson(),
  };
}

class Opportunities {
  Opportunities({
    this.count,
    this.title,
  });

  int? count;
  String? title;

  factory Opportunities.fromJson(Map<String, dynamic> json) => Opportunities(
    count: json["count"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "title": title,
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
