import 'package:flutter/material.dart';
import 'package:stock_portfolio/controller/graph_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineGraph extends StatefulWidget {
  final List<SalesData>? graphData;
  final GraphController? graphControllerr;

  const LineGraph({Key? key, this.graphData, this.graphControllerr}) : super(key: key);
  @override
  _LineGraphState createState() => _LineGraphState();
}

class _LineGraphState extends State<LineGraph> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SfCartesianChart(
          primaryXAxis: CategoryAxis(
            isVisible: true,
            axisLine: AxisLine(
              color: Colors.greenAccent,
            ),
          ),
          plotAreaBorderColor: Colors.transparent,
          borderColor: Colors.transparent,
          trackballBehavior: TrackballBehavior(enable: true,shouldAlwaysShow: true,),
          // Enable legend
          legend: Legend(isVisible: false),
          // Enable tooltip
          series: <ChartSeries<SalesData, String>>[
            LineSeries<SalesData, String>(
                dataSource: widget.graphData!,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
                name: 'Status',enableTooltip: true,color: Color(0xFF282846),
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: false))
          ]),
      Column(
        children: [
          Container(
            height: 40,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                TextButton(
                    onPressed: () {
                      widget.graphControllerr!.time.cancel();
                      widget.graphControllerr!.duration.value = '1d';
                      widget.graphControllerr!.durationData();
                    },
                    child: Text('1D')),
                TextButton(
                    onPressed: () {
                      widget.graphControllerr!.time.cancel();
                      widget.graphControllerr!.duration.value = '5d';
                      widget.graphControllerr!.durationData();
                    },
                    child: Text('1W')),
                TextButton(
                    onPressed: () {
                      widget.graphControllerr!.time.cancel();
                      widget.graphControllerr!.duration.value = '1m';
                      widget.graphControllerr!.durationData();
                    },
                    child: Text('1M')),
                TextButton(
                    onPressed: () {
                      widget.graphControllerr!.time.cancel();
                      widget.graphControllerr!.duration.value = '3m';
                      widget.graphControllerr!.durationData();
                    },
                    child: Text('3M')),
                TextButton(
                    onPressed: () {
                      widget.graphControllerr!.time.cancel();
                      widget.graphControllerr!.duration.value = '6m';
                      widget.graphControllerr!.durationData();
                    },
                    child: Text('6M')),
                TextButton(
                    onPressed: () {
                      widget.graphControllerr!.time.cancel();
                      widget.graphControllerr!.duration.value = '1yr';
                      widget.graphControllerr!.durationData();
                    },
                    child: Text('1Y')),
                TextButton(
                    onPressed: () {
                      widget.graphControllerr!.time.cancel();
                      widget.graphControllerr!.duration.value = '2yr';
                      widget.graphControllerr!.durationData();
                    },
                    child: Text('2Y')),
                TextButton(
                    onPressed: () {
                      widget.graphControllerr!.time.cancel();
                      widget.graphControllerr!.duration.value = '3yr';
                      widget.graphControllerr!.durationData();
                    },
                    child: Text('3Y')),
                TextButton(
                    onPressed: () {
                      widget.graphControllerr!.time.cancel();
                      widget.graphControllerr!.duration.value = '5yr';
                      widget.graphControllerr!.durationData();
                    },
                    child: Text('5Y')),
              ],
            ),
          )
        ],
      ),
    ]);
  }
}
