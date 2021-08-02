import 'dart:convert';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/global_indices_model.dart';

class GlobalIndicesApi extends GetConnect {
  Future<List<GlobalIndicesModel>> detailData() async {
    List<GlobalIndicesModel> data = [];
    data.clear();
    var response = await get("https://appfeeds.moneycontrol.com/jsonapi/home/indices&t_device=androidPhone&t_app=MC&test=false&t_version=51");
    // print(response.body);
    if (response.statusCode == 200) {
      if (response.status.isBlank == false) {
        final globalIndicesModel = globalIndicesModelFromJson(jsonEncode(response.body));
        data.add(globalIndicesModel);
      }
    }
    return data;
  }
}