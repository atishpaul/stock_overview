import 'dart:async';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/commidity_model.dart';
import 'package:stock_portfolio/providers/commodity_api.dart';

class CommodityController extends GetxController {
  final commodityApiController = Get.put(CommodityApi());
  late Timer time;

  var restData = <CommodityModel>[].obs;

  @override
  void onInit() {
    commodityApiController.commodityData().then((commodityData) {
      restData.clear();
      restData.add(commodityData[0]);
      // print(restData[0].data!.datalist![0].heading.toString());
    });
    const oneSec = const Duration(seconds:15);
    time = Timer.periodic(oneSec, (Timer t) {
      commodityApiController.commodityData().then((globalIndicesModels) {
        restData.clear();
        restData.add(globalIndicesModels[0]);
        // print(restData[0].data!.datalist![0].heading.toString());
      });
    });

    // TODO: implement onInit
    super.onInit();
  }
}