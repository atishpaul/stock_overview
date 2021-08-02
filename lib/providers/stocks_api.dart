import 'dart:convert';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/stocks_model.dart';

class StocksApi extends GetConnect {
  Future<List<StocksModel>> detailData() async {
    List<StocksModel> data = [];
    data.clear();
    var response = await get("https://appfeeds.moneycontrol.com/jsonapi/home/stock_movers&t_device=androidPhone&t_app=MC&test=false&t_version=51");
    // print(response.body);
    if (response.statusCode == 200) {
      if (response.status.isBlank == false) {
        final stocksModel = stocksModelFromJson(jsonEncode(response.body));
        data.add(stocksModel);
      }
    }
    return data;
  }
}