import 'package:get/get.dart';
import 'package:stock_portfolio/models/indian_indices_model.dart';
import 'package:stock_portfolio/models/stock_search_model.dart';
import 'package:stock_portfolio/providers/search_api.dart';

class SearchController extends GetxController {
  final searchController = Get.put(SearchApi());
  var time = 'Loading..'.obs;
  var isMarketOpen = false.obs;

  var restDataa = <StockSearchModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}