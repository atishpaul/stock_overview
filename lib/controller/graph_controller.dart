import 'dart:async';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/graph_model.dart';
import 'package:stock_portfolio/providers/graph_api.dart';
import 'package:stock_portfolio/views/stock_detail_page.dart';

class GraphController extends GetxController {
  final graphApiController = Get.put(GraphApi());
  late Timer time;
  late Timer durationTimer;
  var duration = '1d'.obs;

  var restData = <GraphModel>[].obs;
  var data = <SalesData>[].obs;

  void durationData() async {
    graphApiController.graphData(detailedCode,duration.value).then((globalIndicesModels) {
      restData.clear();
      data.clear();
      restData.add(globalIndicesModels[0]);
      for(int a=0; a<= restData[0].graph!.values!.length-1; a++) {
        data.add(
          SalesData(restData[0].graph!.values![a].time.toString(), double.parse(restData[0].graph!.values![a].value.toString().replaceAll(',', ''))),
        );
      }
      // print(restData[0].data!.datalist![0].heading.toString());
    });
    const oneSec = const Duration(seconds:60);
    durationTimer = Timer.periodic(oneSec, (Timer t) {
      graphApiController.graphData(detailedCode,duration.value).then((globalIndicesModels) {
        restData.clear();
        data.clear();
        restData.add(globalIndicesModels[0]);
        for(int a=0; a<= restData[0].graph!.values!.length-1; a++) {
          data.add(
            SalesData(restData[0].graph!.values![a].time.toString(), double.parse(restData[0].graph!.values![a].value.toString().replaceAll(',', ''))),
          );
        }
        // print(restData[0].data!.datalist![0].heading.toString());
      });
    });
  }


  @override
  void onInit() {
    graphApiController.graphData(detailedCode,duration.value).then((globalIndicesModels) {
      restData.clear();
      data.clear();
      restData.add(globalIndicesModels[0]);
      for(int a=0; a<= restData[0].graph!.values!.length-1; a++) {
        data.add(
          SalesData(restData[0].graph!.values![a].time.toString(), double.parse(restData[0].graph!.values![a].value.toString().replaceAll(',', ''))),
        );
      }
      // print(restData[0].data!.datalist![0].heading.toString());
    });
    const oneSec = const Duration(seconds:60);
    time = Timer.periodic(oneSec, (Timer t) {
      graphApiController.graphData(detailedCode,duration.value).then((globalIndicesModels) {
        restData.clear();
        data.clear();
        restData.add(globalIndicesModels[0]);
        for(int a=0; a<= restData[0].graph!.values!.length-1; a++) {
          data.add(
            SalesData(restData[0].graph!.values![a].time.toString(), double.parse(restData[0].graph!.values![a].value.toString().replaceAll(',', ''))),
          );
        }
        // print(restData[0].data!.datalist![0].heading.toString());
      });
    });

    // TODO: implement onInit
    super.onInit();
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}