import 'dart:convert';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/news_models/latest_news_model.dart';

class LatestNewsApi extends GetConnect {
  Future<List<LatestNewsModel>> detailData() async {
    List<LatestNewsModel> data = [];
    data.clear();
    var response = await get("https://appfeeds.moneycontrol.com/jsonapi/home/news&section=top_news");
    // print(response.body);
    if (response.statusCode == 200) {
      if (response.status.isBlank == false) {
        final latestNewsModel = latestNewsModelFromJson(jsonEncode(response.body));
        data.add(latestNewsModel);
      }
    }
    return data;
  }
}