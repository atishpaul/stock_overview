import 'dart:async';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/forum_model.dart';
import 'package:stock_portfolio/models/specific_news_model.dart';
import 'package:stock_portfolio/models/stock_detail_model.dart';
import 'package:stock_portfolio/providers/forum_api.dart';
import 'package:stock_portfolio/providers/specific_stock_news_api.dart';
import 'package:stock_portfolio/providers/stock_detail_api.dart';
import 'package:stock_portfolio/views/stock_detail_page.dart';

enum PagesName {
  OVERVIEW,
  STATISTICS,
  APPEARANCE,
  IN_NEWS,
  PEOPLE_RESPONSES
}

class StocksDetailController extends GetxController {
  final stocksDetailApiController = Get.put(StocksDetailsApi());
  final specificNewsController = Get.put(SpecificStockNewsApi());
  // final forumController = Get.put(ForumApi());
  late Timer time;
  var code = ''.obs;
  var restData = <StockDetailModel>[].obs;
  var newsData = <SpecificNewsModel>[].obs;
  var forumData = <ForumModel>[].obs;
  var pageController = (PagesName.OVERVIEW).obs;



  @override
  void onInit() {
    pageController.value = PagesName.OVERVIEW;
    stocksDetailApiController.detailData(detailedCode).then((globalIndicesModels) {
      restData.clear();
      restData.add(globalIndicesModels[0]);
      print(restData[0].data!.refreshData!.rate.toString());
    });
    // specfic news coming below
    specificNewsController.getSpecificNews(detailedCode).then((newsSpecific) {
      newsData.add(newsSpecific[0]);
    });
    // forum data coming below
    // forumController.forumData(detailedCode).then((forumSpecific) {
    //   forumData.add(forumSpecific[0]);
    // });
    const oneSec = const Duration(seconds:15);
    time = Timer.periodic(oneSec, (Timer t) {
      // specfic news coming below
      specificNewsController.getSpecificNews(detailedCode).then((newsSpecific) {
        newsData.add(newsSpecific[0]);
      });
      // forum data coming below
      // forumController.forumData(detailedCode).then((forumSpecific) {
      //   forumData.add(forumSpecific[0]);
      // });
      stocksDetailApiController.detailData(detailedCode).then((globalIndicesModels) {
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
    restData.close();
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void dispose() {
    time.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}