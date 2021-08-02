import 'dart:async';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/indian_indices_model.dart';
import 'package:stock_portfolio/models/news_models/latest_news_model.dart';
import 'package:stock_portfolio/providers/indian_indices_api.dart';
import 'package:stock_portfolio/providers/latest_news_api.dart';

class LatestNewsController extends GetxController {
  final latestNewsApi = Get.put(LatestNewsApi());
  late Timer time;

  var latestNewsModel = <LatestNewsModel>[].obs;

  @override
  void onInit() {
    latestNewsApi.detailData().then((lnm) {
      latestNewsModel.clear();
      latestNewsModel.add(lnm[0]);
      print(latestNewsModel[0].data!.sectionId.toString());
    });
    const oneSec = const Duration(seconds:15);
    time = Timer.periodic(oneSec, (Timer t) {
      latestNewsApi.detailData().then((lnm) {
        latestNewsModel.clear();
        latestNewsModel.add(lnm[0]);
        print(latestNewsModel[0].data!.sectionId.toString());
      });
    });

    // TODO: implement onInit
    super.onInit();
  }
}