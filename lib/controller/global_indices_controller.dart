import 'dart:async';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/global_indices_model.dart';
import 'package:stock_portfolio/providers/global_indices_api.dart';

class GlobalIndicesController extends GetxController {
  final globalIndicesController = Get.put(GlobalIndicesApi());
  late Timer time;

  var restData = <GlobalIndicesModel>[].obs;

  @override
  void onInit() {
    globalIndicesController.detailData().then((globalIndicesModels) {
      restData.clear();
      restData.add(globalIndicesModels[0]);
      print(restData[0].data!.datalist![0].heading.toString());
    });
    const oneSec = const Duration(seconds:15);
    time = Timer.periodic(oneSec, (Timer t) {
      globalIndicesController.detailData().then((globalIndicesModels) {
        restData.clear();
        restData.add(globalIndicesModels[0]);
        print(restData[0].data!.datalist![0].heading.toString());
      });
    });

    // TODO: implement onInit
    super.onInit();
  }
}