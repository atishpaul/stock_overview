import 'dart:convert';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/stock_search_model.dart';

class SearchApi extends GetConnect {
  Future<List<StockSearchModel>> searchFor(String searchedText) async {
    List<StockSearchModel> data = [];
    data.clear();
    var response = await get("https://appfeeds.moneycontrol.com/jsonapi/search/common?format=json&flag=autosuggest&query=$searchedText&t_device=androidPhone&t_app=MC&test=false&t_version=51");
    // print(response.body);
    if (response.statusCode == 200) {
      if (response.status.isBlank == false) {
        final stockSearchModel = stockSearchModelFromJson(jsonEncode(response.body));
        print(stockSearchModel.result![0].name.toString());
        data.add(stockSearchModel);
      }
    }
    return data;
  }
}