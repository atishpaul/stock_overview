import 'dart:convert';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/commidity_model.dart';

class CommodityApi extends GetConnect {
  Future<List<CommodityModel>> commodityData() async {
    List<CommodityModel> data = [];
    data.clear();
    var response = await get("https://appfeeds.moneycontrol.com/jsonapi/home/market_action&asset=commodity,currency&t_device=androidPhone&t_app=MC&test=false&t_version=51");
    // print(response.body);
    if (response.statusCode == 200) {
      if (response.status.isBlank == false) {
        final commodityModel = commodityModelFromJson(jsonEncode(response.body));
        data.add(commodityModel);
      }
    }
    return data;
  }
}