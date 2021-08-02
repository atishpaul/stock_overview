import 'dart:async';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/indian_indices_model.dart';
import 'package:stock_portfolio/providers/indian_indices_api.dart';

class HomeController extends GetxController {
  final indianIndicesController = Get.put(IndianIndicesApi());
  var isMarketOpen = false.obs;
  late Timer time;

  var restData = <IndianIndicesModel>[].obs;

  @override
  void onInit() {
    indianIndicesController.detailData().then((indianIndicesModels) {
      restData.clear();
      restData.add(indianIndicesModels[0]);
      print(restData[0].refreshDetails!.rate.toString());
    });
    const oneSec = const Duration(seconds:15);
    time = Timer.periodic(oneSec, (Timer t) {
      indianIndicesController.detailData().then((indianIndicesModels) {
        restData.clear();
        restData.add(indianIndicesModels[0]);
        print(restData[0].refreshDetails!.rate.toString());
      });
    });

    // TODO: implement onInit
    super.onInit();
  }
}