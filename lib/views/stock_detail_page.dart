import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_portfolio/charts/line_chart.dart';
import 'package:stock_portfolio/controller/graph_controller.dart';
import 'package:stock_portfolio/controller/stock_details_controller.dart';
import 'package:stock_portfolio/views/tabs/detail_page_tabs/swot.dart';
import 'package:stock_portfolio/views/tabs/detail_page_tabs/in_news.dart';
import 'package:stock_portfolio/views/tabs/detail_page_tabs/people_responses.dart';
import 'package:stock_portfolio/views/tabs/detail_page_tabs/statistics.dart';

String detailedCode = '' ;

class StockDetailPage extends StatefulWidget {
  final String? code;
  final String? heroGen;

  const StockDetailPage({Key? key, this.code, this.heroGen}) : super(key: key);
  @override
  _StockDetailPageState createState() => _StockDetailPageState();
}

class _StockDetailPageState extends State<StockDetailPage> {
  final stockDetailController = Get.put(StocksDetailController());
  final graphController = Get.put(GraphController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    stockDetailController.time.cancel();
    graphController.time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.heroGen.toString(),
      child: Scaffold(
        body: GetX<StocksDetailController>(
          builder: (controller) {
            if(controller.restData.isNotEmpty) {
              return Column(
                children: [
                  Container(
                      color: Color(0xFF4F0E0E),
                      height: 200,
                      child: SafeArea(
                        top: true,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Container(
                                      color: Colors.black12,
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.arrow_back),
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Container(
                                      color: Colors.black12,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.verified_outlined),
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.restData[0].data!.priceinfo!.shortname.toString(),
                                      style: GoogleFonts.manrope(color: Colors.white70, fontSize: 24, fontWeight: FontWeight.bold),maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Container(
                                      color: Colors.black26,
                                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                      child: Text(
                                        controller.restData[0].data!.scriptInfo!.sector.toString(),
                                        style: GoogleFonts.manrope(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.restData[0].data!.priceinfo!.lastvalue.toString(),
                                    style: GoogleFonts.manrope(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      color: Colors.black26,
                                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Indicator : ',
                                            style: GoogleFonts.manrope(color: Colors.white54, fontSize: 10, fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            controller.restData[0].data!.indicators.toString(),
                                            style: GoogleFonts.manrope(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    controller.restData[0].data!.priceinfo!.chg.toString(),
                                    style: GoogleFonts.manrope(color: !double.parse(controller.restData[0].data!.priceinfo!.chg.toString().replaceAll(',', '')).isNegative  ? Colors.lightGreenAccent : Colors.redAccent, fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '(' + controller.restData[0].data!.priceinfo!.percentchange.toString() + '%)',
                                    style: GoogleFonts.manrope(color: !double.parse(controller.restData[0].data!.priceinfo!.percentchange.toString().replaceAll(',', '')).isNegative  ? Colors.lightGreenAccent : Colors.redAccent, fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: 35
                      ),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: () {
                              stockDetailController.pageController.value = PagesName.OVERVIEW;
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                  color: stockDetailController.pageController.value == PagesName.OVERVIEW ? Colors.brown: Colors.black54,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Overview', style: GoogleFonts.manrope(color: Colors.white70,fontWeight: FontWeight.w600),),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: InkWell(
                              onTap: () {
                                stockDetailController.pageController.value = PagesName.STATISTICS;
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                    color: stockDetailController.pageController.value == PagesName.STATISTICS ? Colors.brown: Colors.black54,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Statistics', style: GoogleFonts.manrope(color: Colors.white70,fontWeight: FontWeight.w600),),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: InkWell(
                              onTap: () {
                                stockDetailController.pageController.value = PagesName.APPEARANCE;
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                    color: stockDetailController.pageController.value == PagesName.APPEARANCE ? Colors.brown: Colors.black54,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Appearance (SWOT)', style: GoogleFonts.manrope(color: Colors.white70,fontWeight: FontWeight.w600),),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: InkWell(
                              onTap: () {
                                stockDetailController.pageController.value = PagesName.IN_NEWS;
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                    color: stockDetailController.pageController.value == PagesName.IN_NEWS ? Colors.brown: Colors.black54,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('In News', style: GoogleFonts.manrope(color: Colors.white70,fontWeight: FontWeight.w600),),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: InkWell(
                              onTap: () {
                                stockDetailController.pageController.value = PagesName.PEOPLE_RESPONSES;
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                    color: stockDetailController.pageController.value == PagesName.PEOPLE_RESPONSES ? Colors.brown: Colors.black54,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('People Responses', style: GoogleFonts.manrope(color: Colors.white70,fontWeight: FontWeight.w600),),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  controller.pageController.value == PagesName.OVERVIEW ? Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical, shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 5),
                          child: Row(
                            children: [
                              Text(
                                'Graph',
                                style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        Obx(() => LineGraph(graphData: graphController.data.value, graphControllerr: graphController,),),
                        Obx(() => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Today's Low",
                                    style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black54),),
                                  Text('₹'+ stockDetailController.restData[0].data!.priceinfo!.daylow.toString(),
                                    style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.deepOrange),)
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Yesterday's Closer",
                                    style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black54),),
                                  Text('₹'+ stockDetailController.restData[0].data!.priceinfo!.yesterdaysclose.toString(),
                                    style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.blue),)
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Today's High",
                                    style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black54),),
                                  Text('₹'+ stockDetailController.restData[0].data!.priceinfo!.dayhigh.toString(),
                                    style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.teal),)
                                ],
                              ),
                            ],
                          ),
                        )),
                        Obx(() => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("52W Low",
                                    style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black54),),
                                  Text('₹'+ stockDetailController.restData[0].data!.priceinfo!.yearlylow.toString(),
                                    style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.deepOrange),)
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("52W High",
                                    style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black54),),
                                  Text('₹'+ stockDetailController.restData[0].data!.priceinfo!.yearlyhigh.toString(),
                                    style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.teal),)
                                ],
                              ),
                            ],
                          ),
                        )),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "What's Happening ?",
                                    style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Color(0xFFEEEEEE),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: controller.restData[0].data!.alerts!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(18),
                                          child: Container(
                                            color: Colors.white70,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                controller.restData[0].data!.alerts![index].title.toString(),
                                                                style: GoogleFonts.manrope(
                                                                    fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54),
                                                              ),
                                                              Text('  •  ',
                                                                style: GoogleFonts.manrope(
                                                                    fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54),),
                                                              Text(
                                                                controller.restData[0].data!.alerts![index].entdate.toString(),
                                                                style: GoogleFonts.manrope(
                                                                    fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black54),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 4,),
                                                          Container(
                                                            width: MediaQuery
                                                                .of(context)
                                                                .size
                                                                .width - 60,
                                                            child: Text(
                                                                controller.restData[0].data!.alerts![index].message.toString().replaceAll(
                                                                    '||', '.\n'),
                                                                style: GoogleFonts.manrope(
                                                                    fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black87)
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Obx(() => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Bonus",
                                    style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  color: Colors.indigo,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Dividend : ",
                                              style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white70),
                                            ),
                                            Text(
                                              stockDetailController.restData[0].data!.statistics!.dividend.toString() + '%',
                                              style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white70),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Dividend Yield : ",
                                              style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white70),
                                            ),
                                            Text(
                                              stockDetailController.restData[0].data!.statistics!.divYield.toString() + '%',
                                              style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white70),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ):controller.pageController.value == PagesName.STATISTICS ? StatisticsTab(statsController: stockDetailController,): controller.pageController.value == PagesName.APPEARANCE ? SwotTab(): controller.pageController.value == PagesName.IN_NEWS ? InNewsTab(scripName: controller.restData[0].data!.priceinfo!.shortname.toString(),scripLastValue: controller.restData[0].data!.priceinfo!.lastvalue.toString(),): controller.pageController.value == PagesName.PEOPLE_RESPONSES ? PeopleResponsesTab() : Row(),
                ],
              );
            } else {
              return Center(child: Container(width: 25,height: 25,child: CircularProgressIndicator(strokeWidth: 4.5,color: Colors.amber,)),);
            }
          },),
      ),
    );
  }
}
