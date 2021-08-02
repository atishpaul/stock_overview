import 'dart:convert';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/indian_indices_model.dart';

class IndianIndicesApi extends GetConnect {
  Future<List<IndianIndicesModel>> detailData() async {
    List<IndianIndicesModel> data = [];
    data.clear();
    var response = await get("https://appfeeds.moneycontrol.com/appxml/indices_5_EN.json");
    // print(response.body);
    if (response.statusCode == 200) {
      if (response.status.isBlank == false) {
        final indianIndicesModel = indianIndicesModelFromJson(jsonEncode(response.body));
        data.add(indianIndicesModel);
      }
    }
    return data;
  }
}