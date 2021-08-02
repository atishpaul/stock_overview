import 'dart:convert';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/stock_detail_model.dart';

class StocksDetailsApi extends GetConnect {
  Future<List<StockDetailModel>> detailData(String code) async {
    List<StockDetailModel> data = [];
    data.clear();
    var response = await get("https://appfeeds.moneycontrol.com/jsonapi/stocks/overviewnew&format=json&sc_id=$code&ex=N&t_device=androidPhone&t_app=MC&test=false&t_version=51");
    // print(response.body);
    if (response.statusCode == 200) {
      if (response.status.isBlank == false) {
        final stocksModel = stockDetailModelFromJson(jsonEncode(response.body));
        data.add(stocksModel);
      }
    }
    return data;
  }
}