// To parse this JSON data, do
//
//     final graphModel = graphModelFromJson(jsonString);

import 'dart:convert';

GraphModel graphModelFromJson(String str) => GraphModel.fromJson(json.decode(str));

String graphModelToJson(GraphModel data) => json.encode(data.toJson());

class GraphModel {
  GraphModel({
    this.refreshDetails,
    this.graph,
    this.tabs,
    this.dropdown,
  });

  RefreshDetails? refreshDetails;
  Graph? graph;
  Dropdown? tabs;
  Dropdown? dropdown;

  factory GraphModel.fromJson(Map<String, dynamic> json) => GraphModel(
    refreshDetails: RefreshDetails.fromJson(json["refresh_details"]),
    graph: Graph.fromJson(json["graph"]),
    tabs: Dropdown.fromJson(json["tabs"]),
    dropdown: Dropdown.fromJson(json["dropdown"]),
  );

  Map<String, dynamic> toJson() => {
    "refresh_details": refreshDetails!.toJson(),
    "graph": graph!.toJson(),
    "tabs": tabs!.toJson(),
    "dropdown": dropdown!.toJson(),
  };
}

class Dropdown {
  Dropdown({
    this.item,
  });

  List<Item>? item;

  factory Dropdown.fromJson(Map<String, dynamic> json) => Dropdown(
    item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "item": List<dynamic>.from(item!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.name,
    this.url,
    this.uniqueId,
  });

  String? name;
  String? url;
  String? uniqueId;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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

class Graph {
  Graph({
    this.name,
    this.dateTime,
    this.currentClose,
    this.prevClose,
    this.direction,
    this.values,
  });

  String? name;
  String? dateTime;
  String? currentClose;
  String? prevClose;
  String? direction;
  List<Value>? values;

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
    name: json["name"],
    dateTime: json["date_time"],
    currentClose: json["current_close"],
    prevClose: json["prev_close"],
    direction: json["direction"],
    values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "date_time": dateTime,
    "current_close": currentClose,
    "prev_close": prevClose,
    "direction": direction,
    "values": List<dynamic>.from(values!.map((x) => x.toJson())),
  };
}

class Value {
  Value({
    this.time,
    this.value,
    this.volume,
    this.chg,
    this.pchg,
    this.dir,
  });

  String? time;
  String? value;
  String? volume;
  String? chg;
  String? pchg;
  String? dir;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    time: json["_time"],
    value: json["_value"],
    volume: json["_volume"],
    chg: json["_chg"],
    pchg: json["_pchg"],
    dir: json["_dir"],
  );

  Map<String, dynamic> toJson() => {
    "_time": time,
    "_value": value,
    "_volume": volume,
    "_chg": chg,
    "_pchg": pchg,
    "_dir": dir,
  };
}

class RefreshDetails {
  RefreshDetails({
    this.flag,
    this.rate,
  });

  String? flag;
  String? rate;

  factory RefreshDetails.fromJson(Map<String, dynamic> json) => RefreshDetails(
    flag: json["flag"],
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "flag": flag,
    "rate": rate,
  };
}
