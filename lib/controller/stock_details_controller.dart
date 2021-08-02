import 'dart:async';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/stock_detail_model.dart';
import 'package:stock_portfolio/providers/stock_detail_api.dart';

class StocksDetailController extends GetxController {
  final stocksDetailApiController = Get.put(StocksDetailsApi());
  late Timer time;
  var code = ''.obs;
  var restData = <StockDetailModel>[].obs;

  @override
  void onInit() {
    stocksDetailApiController.detailData(code.value).then((globalIndicesModels) {
      restData.clear();
      restData.add(globalIndicesModels[0]);
      print(restData[0].data!.refreshData!.rate.toString());
    });
    const oneSec = const Duration(seconds:15);
    time = Timer.periodic(oneSec, (Timer t) {
      stocksDetailApiController.detailData(code.value).then((globalIndicesModels) {
        restData.clear();
        restData.add(globalIndicesModels[0]);
        print(restData[0].data!.refreshData!.rate.toString());
      });
    });

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    time.cancel();
    // TODO: implement onClose
    super.onClose();
  }
}