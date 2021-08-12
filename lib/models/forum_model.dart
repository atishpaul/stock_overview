// To parse this JSON data, do
//
//     final forumModel = forumModelFromJson(jsonString);

import 'dart:convert';

ForumModel forumModelFromJson(String str) => ForumModel.fromJson(json.decode(str));

String forumModelToJson(ForumModel data) => json.encode(data.toJson());

class ForumModel {
  ForumModel({
    this.refreshData,
    this.list,
    this.dropdown,
  });

  RefreshData? refreshData;
  List<ListElement>? list;
  List<Dropdown>? dropdown;

  factory ForumModel.fromJson(Map<String, dynamic> json) => ForumModel(
    refreshData: RefreshData.fromJson(json["refresh_data"]),
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    dropdown: List<Dropdown>.from(json["dropdown"].map((x) => Dropdown.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "refresh_data": refreshData!.toJson(),
    "list": List<dynamic>.from(list!.map((x) => x.toJson())),
    "dropdown": List<dynamic>.from(dropdown!.map((x) => x.toJson())),
  };
}

class Dropdown {
  Dropdown({
    this.name,
    this.url,
    this.uniqueId,
    this.selected,
  });

  String? name;
  String? url;
  String? uniqueId;
  int? selected;

  factory Dropdown.fromJson(Map<String, dynamic> json) => Dropdown(
    name: json["name"],
    url: json["url"],
    uniqueId: json["uniqueId"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "uniqueId": uniqueId,
    "selected": selected,
  };
}

class ListElement {
  ListElement({
    this.storyId,
    this.headline,
    this.thumbnail,
    this.attachment,
    this.creationtime,
    this.storyType,
    this.isPremium,
    this.shareUrl,
  });

  String? storyId;
  String? headline;
  String? thumbnail;
  String? attachment;
  String? creationtime;
  StoryType? storyType;
  dynamic isPremium;
  String? shareUrl;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    storyId: json["story_id"],
    headline: json["headline"],
    thumbnail: json["thumbnail"],
    attachment: json["attachment"],
    creationtime: json["creationtime"],
    storyType: storyTypeValues.map[json["story_type"]],
    isPremium: json["is_premium"],
    shareUrl: json["share_url"],
  );

  Map<String, dynamic> toJson() => {
    "story_id": storyId,
    "headline": headline,
    "thumbnail": thumbnail,
    "attachment": attachment,
    "creationtime": creationtime,
    "story_type": storyTypeValues.reverse[storyType],
    "is_premium": isPremium,
    "share_url": shareUrl,
  };
}

enum StoryType { TEXT }

final storyTypeValues = EnumValues({
  "Text": StoryType.TEXT
});

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
