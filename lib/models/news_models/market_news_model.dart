// To parse this JSON data, do
//
//     final marketNewsModel = marketNewsModelFromJson(jsonString);

import 'dart:convert';

MarketNewsModel marketNewsModelFromJson(String str) => MarketNewsModel.fromJson(json.decode(str));

String marketNewsModelToJson(MarketNewsModel data) => json.encode(data.toJson());

class MarketNewsModel {
  MarketNewsModel({
    this.refreshDetails,
    this.list,
  });

  RefreshDetails? refreshDetails;
  List<ListElement>? list;

  factory MarketNewsModel.fromJson(Map<String, dynamic> json) => MarketNewsModel(
    refreshDetails: RefreshDetails.fromJson(json["refresh_details"]),
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "refresh_details": refreshDetails!.toJson(),
    "list": List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    this.headline,
    this.storyId,
    this.storyType,
    this.creationtime,
    this.thumbnail,
    this.medium,
    this.largeImg,
    this.isPremium,
    this.shareUrl,
    this.tag,
    this.authorName,
    this.authorImg,
    this.intro,
    this.rankCustomField,
    this.blinkDot,
    this.blinkText,
    this.textReversed,
    this.categoryName,
    this.source,
  });

  String? headline;
  String? storyId;
  StoryType? storyType;
  String? creationtime;
  String? thumbnail;
  String? medium;
  String? largeImg;
  int? isPremium;
  String? shareUrl;
  Tag? tag;
  String? authorName;
  String? authorImg;
  String? intro;
  String? rankCustomField;
  int? blinkDot;
  int? blinkText;
  int? textReversed;
  CategoryName? categoryName;
  Source? source;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    headline: json["headline"],
    storyId: json["story_id"],
    storyType: storyTypeValues.map[json["story_type"]],
    creationtime: json["creationtime"],
    thumbnail: json["thumbnail"],
    medium: json["medium"],
    largeImg: json["large_img"],
    isPremium: json["is_premium"],
    shareUrl: json["share_url"],
    tag: tagValues.map[json["tag"]],
    authorName: json["author_name"],
    authorImg: json["author_img"],
    intro: json["intro"],
    rankCustomField: json["rank_custom_field"],
    blinkDot: json["blink_dot"],
    blinkText: json["blink_text"],
    textReversed: json["text_reversed"],
    categoryName: categoryNameValues.map[json["category_name"]],
    source: sourceValues.map[json["source"]],
  );

  Map<String, dynamic> toJson() => {
    "headline": headline,
    "story_id": storyId,
    "story_type": storyTypeValues.reverse[storyType],
    "creationtime": creationtime,
    "thumbnail": thumbnail,
    "medium": medium,
    "large_img": largeImg,
    "is_premium": isPremium,
    "share_url": shareUrl,
    "tag": tagValues.reverse[tag],
    "author_name": authorName,
    "author_img": authorImg,
    "intro": intro,
    "rank_custom_field": rankCustomField,
    "blink_dot": blinkDot,
    "blink_text": blinkText,
    "text_reversed": textReversed,
    "category_name": categoryNameValues.reverse[categoryName],
    "source": sourceValues.reverse[source],
  };
}

enum CategoryName { BUSINESS, BUSINESS_WORLD, BUSINESS_INTERVIEW }

final categoryNameValues = EnumValues({
  "Business": CategoryName.BUSINESS,
  "Business, Interview": CategoryName.BUSINESS_INTERVIEW,
  "Business, World": CategoryName.BUSINESS_WORLD
});

enum Source { MONEYCONTROL_COM, AP, REUTERS, PTI }

final sourceValues = EnumValues({
  "AP": Source.AP,
  "Moneycontrol.com": Source.MONEYCONTROL_COM,
  "PTI": Source.PTI,
  "Reuters": Source.REUTERS
});

enum StoryType { TEXT, LIVEBLOG }

final storyTypeValues = EnumValues({
  "liveblog": StoryType.LIVEBLOG,
  "Text": StoryType.TEXT
});

enum Tag { MARKETS }

final tagValues = EnumValues({
  "markets": Tag.MARKETS
});

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
