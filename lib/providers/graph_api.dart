import 'dart:convert';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/graph_model.dart';


class GraphApi extends GetConnect {
  Future<List<GraphModel>> graphData(String code,String duration) async {
    List<GraphModel> data = [];
    data.clear();
    var response = await get("https://appfeeds.moneycontrol.com/jsonapi/stocks/graph&format=json&sc_id=$code&ex=&range=$duration&type=area");
    // print(response.body);
    if (response.statusCode == 200) {
      if (response.status.isBlank == false) {
        final graphModel = graphModelFromJson(jsonEncode(response.body));
        data.add(graphModel);
      }
    }
    return data;
  }
}