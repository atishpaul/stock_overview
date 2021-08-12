import 'dart:convert';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/specific_news_model.dart';

class SpecificStockNewsApi extends GetConnect {
  Future<List<SpecificNewsModel>> getSpecificNews(String searchedText) async {
    List<SpecificNewsModel> data = [];
    data.clear();
    var response = await get("https://appfeeds.moneycontrol.com/jsonapi/stocks/news&format=json&sc_id=$searchedText&start=pageno");
    // print(response.body);
    if (response.statusCode == 200) {
      if (response.status.isBlank == false) {
        final specificNewsModel = specificNewsModelFromJson(jsonEncode(response.body));
        print(specificNewsModel.list![0].headline.toString());
        data.add(specificNewsModel);
      }
    }
    return data;
  }
}