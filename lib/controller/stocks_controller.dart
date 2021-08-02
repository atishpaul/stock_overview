import 'dart:async';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/stocks_model.dart';
import 'package:stock_portfolio/providers/stocks_api.dart';

class StocksController extends GetxController {
  final stocksApiController = Get.put(StocksApi());
  late Timer time;

  var restData = <StocksModel>[].obs;

  @override
  void onInit() {
    stocksApiController.detailData().then((globalIndicesModels) {
      restData.clear();
      restData.add(globalIndicesModels[0]);
      print(restData[0].data!.datalist![0].heading.toString());
    });
    const oneSec = const Duration(seconds:15);
    time = Timer.periodic(oneSec, (Timer t) {
      stocksApiController.detailData().then((globalIndicesModels) {
        restData.clear();
        restData.add(globalIndicesModels[0]);
        print(restData[0].data!.datalist![0].heading.toString());
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